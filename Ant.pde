class Ant {
  int direction = random.nextInt(5); // 0 - up; 1 - right; 2 - down; 3 - left;
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
    float x = 0;
    float y = 0;
    
    if(grid[j][i] == true) {
      direction--;
      grid[j][i] = false;
    } else {
      direction++;
      grid[j][i] = true;
    }
    
    if(direction == 4) direction = 0;
    if(direction == -1) direction = 3;
    
    switch (direction) {
      case 0: j--;
              break;
      case 1: i++;
              break;
      case 2: j++;
              break;
      case 3: i--;
              break;
    }
    
    if (i < 0)         i = rows - 1;
    if (i > rows - 1)  i = 0;
    if (j < 0)         j = cols - 1;
    if (j > cols - 1)  j = 0;
    
     switch (direction) {
      case 0: x = i * cellWidth + cellWidth / 2;
              y = j * cellHeight + cellHeight + cellHeight / 4;
              break;
      case 1: x = i * cellWidth + cellWidth / 4 - cellWidth / 2;
              y = j * cellHeight + cellHeight / 2;
              break;
      case 2: x = i * cellWidth + cellWidth / 2;
              y = j * cellHeight + cellHeight / 4 - cellHeight / 2;
              break;
      case 3: x = i * cellWidth + cellWidth + cellWidth / 2 - cellWidth / 4;
              y = j * cellHeight + cellHeight / 2;
              break;
    }
    
    stroke(0, 255, 0);
    strokeWeight(cellWidth / 5);
    point(x, y);
  }
}