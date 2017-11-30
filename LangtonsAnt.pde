int rows = 25;
int cols = 25;

public float cellWidth;
public float cellHeight;

boolean[][] grid = new boolean[rows][cols];

Ant ant;

void setup() {
  size(800, 800);
  
  for(int i = 0; i < rows; i++) {
    for(int j = 0; j < cols; j++) {
      grid[i][j] = false;
    }
  }
  
  ant = new Ant(5, 5);
}

void draw() {
  background(255);
  
  DrawGrid(grid);
  ant.DrawAnt();
}

void DrawGrid(boolean[][] grid) {
  cellWidth = width / rows;
  cellHeight = height / cols;
  
  for(int i = 0; i < rows; i++) {
    for(int j = 0; j < cols; j++) {
      fill(255);
      if(grid[i][j] == true) fill(0);
      rect(j * cellWidth, i * cellHeight, cellWidth - 1, cellHeight - 1);
    }
  }
}