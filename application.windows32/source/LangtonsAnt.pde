import java.util.*;

final Random random = new Random();

int rows = 800;
int cols = 800;

int antsCount = 50;

int steps = 0;

public float cellWidth;
public float cellHeight;

public boolean[][] grid = new boolean[rows][cols];

Ant[] ants = new Ant[antsCount];

void setup() {
  size (800, 800);
  
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

void draw() {
  for(int i = 0; i < antsCount; i++) {
    ants[i].MoveAnt();
  }
  
  fill(0);
  rect(5, height - 30, 100, 25);
  fill(255);
  text(steps, 7, height - 15);
  steps++;
  
  if(steps % 100000 == 0) saveFrame("notSoManyAntsSnapshot-######.png");
}

public void ShowCell(int x, int y, color col) {
  noStroke();
  fill(0);
  if(grid[x][y]) fill(col);
  rect(x * cellWidth, y * cellHeight, cellWidth, cellHeight);
}