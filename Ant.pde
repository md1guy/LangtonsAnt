class Ant {
  int direction = random.nextInt(4); // 0 - up; 1 - right; 2 - down; 3 - left;
  int x;
  int y;
  
  color col = color(random.nextInt((256)), random.nextInt((256)), random.nextInt((256)));
  
  PVector offset = new PVector();
  
  Ant(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void ShowAnt() {
    noStroke();
    fill(255, 0, 0);
    ellipse(x * cellWidth + cellWidth / 2, y * cellHeight + cellHeight / 2, cellWidth, cellHeight);
  }
  
  void MoveAnt() {
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