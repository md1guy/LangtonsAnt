class Ant {
  int direction = 0; // 0 - up; 1 - right; 2 - down; 3 - left;
  int i;
  int j;
  
  Ant (int i, int j) {
    this.i = i;
    this.j = j;
  }
  
  void DrawAnt() {
    
    
    fill(255, 0, 0);
    ellipse(i * cellWidth + cellWidth / 2, j * cellHeight + cellHeight / 2, cellWidth / 2, cellHeight / 2);
    
    
  }
  
  void MoveAnt(boolean[][] grid) {
    if(grid[i][j] == true) {
      direction--;
      grid[i][j] = false;
    } else {
      direction++;
      grid[i][j] = true;
    }
    
    if(direction == 4) direction = 0;
    if(direction == -1) direction = 3;
    
    switch (direction) {
      case 0: i--;
              break;
      case 1: j++;
              break;
      case 2: i++;
              break;
      case 3: j--;
              break;
    }
    
    if (i < 0)         i = rows - 1;
    if (i > rows - 1)  i = 0;
    if (j < 0)         j = cols - 1;
    if (j > cols - 1)  i = 0;
    
    float x = 0;
    float y = 0;
    
    switch (direction) {
      case 0: x = i * cellWidth + cellWidth / 2;
              y = j * cellHeight + cellHeight / 4;
              break;
      case 1: x = i * cellWidth + cellWidth - cellWidth / 4;
              y = j * cellHeight + cellHeight / 2;
              break;
      case 2: x = i * cellWidth + cellWidth / 2;
              y = j * cellHeight + cellHeight - cellHeight / 4;
              break;
      case 3: x = i * cellWidth + cellWidth / 4;
              y = j * cellHeight + cellHeight / 2;
              break;
    }
    
    stroke(0, 255, 0);
    strokeWeight(cellWidth / 5);
    point(x, y);
  }
}