import java.util.*;

final Random random = new Random();

int rows = 100;
int cols = 100;

public float cellWidth;
public float cellHeight;

boolean[][] grid = new boolean[rows][cols];

Ant ant;

void setup() {
  size(800, 800);
  
  cellWidth = width / rows;
  cellHeight = height / cols;
  
  background(51);
  
  frameRate(10000);
  
  for(int i = 0; i < rows; i++) {
    for(int j = 0; j < cols; j++) {
      grid[i][j] = false;
    }
  }
  
  ant = new Ant(rows / 2, cols / 2);
}

void draw() {
  DrawGrid(grid);
  ant.DrawAnt();
  ant.MoveAnt(grid);
}

void DrawGrid(boolean[][] grid) {
  for(int i = 0; i < rows; i++) {
    for(int j = 0; j < cols; j++) {
      noStroke();
      strokeWeight(1);
      fill(255);
      if(grid[i][j] == true) fill(0);
      rect(j * cellWidth, i * cellHeight, cellWidth, cellHeight);
    }
  }
}