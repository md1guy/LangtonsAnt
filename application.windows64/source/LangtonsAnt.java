import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class LangtonsAnt extends PApplet {



final Random random = new Random();

int rows = 800;
int cols = 800;

int antsCount = 100;

int steps = 0;

public float cellWidth;
public float cellHeight;

public boolean[][] grid = new boolean[rows][cols];

Ant[] ants = new Ant[antsCount];

public void setup() {
  
  
  cellWidth = width / rows;
  cellHeight = height / cols;
  
  background(51);
  
  frameRate(10000);
  
  for(int y = 0; y < cols; y++) {
    for(int x = 0; x < rows; x++) {
      grid[x][y] = false;
      ShowCell(x, y, color(0));
    }
  }
  
  
  
  for(int i = 0; i < antsCount; i++) {
    ants[i] = new Ant(random.nextInt(cols - 1), random.nextInt(rows - 1));
    ants[i].ShowAnt();
  }
}

public void draw() {
  for(int i = 0; i < antsCount; i++) {
    ants[i].MoveAnt();
  }
  
  fill(0);
  rect(5, height - 30, 100, 25);
  fill(255);
  text(steps, 7, height - 15);
  steps++;
}

public void ShowCell(int x, int y, int col) {
  noStroke();
  fill(0);
  if(grid[x][y]) fill(col);
  rect(x * cellWidth, y * cellHeight, cellWidth, cellHeight);
}
class Ant {
  int direction = random.nextInt(4); // 0 - up; 1 - right; 2 - down; 3 - left;
  int x;
  int y;
  int col = color(random.nextInt((256)), random.nextInt((256)), random.nextInt((256)));
  
  Ant(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  public void ShowAnt() {
    noStroke();
    fill(255, 0, 0);
    ellipse(x * cellWidth + cellWidth / 2, y * cellHeight + cellHeight / 2, cellWidth, cellHeight);
  }
  
  public void MoveAnt() {
    if(grid[x][y]) {
      direction--;
      grid[x][y] = false;
    } else {
      direction++;
      grid[x][y] = true;
    }
    
    if(direction == 4) direction = 0;
    if(direction == -1) direction = 3;
    
    ShowCell(x, y, col);
    
    switch (direction) {
      case 0: y--;
              break;
      case 1: x++;
              break;
      case 2: y++;
              break;
      case 3: x--;
              break;
    }
    
    if (x < 0)         x = rows - 1;
    if (x > rows - 1)  x = 0;
    if (y < 0)         y = cols - 1;
    if (y > cols - 1)  y = 0;
    
    ShowAnt();
  }
}
  public void settings() {  size(800, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "LangtonsAnt" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
