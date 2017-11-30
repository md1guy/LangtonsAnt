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
  
  void MoveAnt() {
    
  }
}