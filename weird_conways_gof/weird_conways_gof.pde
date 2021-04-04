float cellSize = 10;

int[][] cells;
int[][] newCells;

float interval = 100;
float currentTime = 0;

void setup(){
  size(600, 600);
  noStroke();
  cells = new int[(int)(width / cellSize)][int(height / cellSize)];
  newCells = new int[(int)(width / cellSize)][int(height / cellSize)];
  reset();
}

void draw(){
  background(0,255,0);
  for(int i = 0; i < (width / cellSize); i++){
    for(int j = 0; j < (height / cellSize); j++){
      fill((1-cells[i][j])*255);
      rect((i)*cellSize,(j)*cellSize,cellSize,cellSize);
    }
  }
  
  if (millis()-currentTime>interval) {
    iteration();
    currentTime = millis();
  }
}

void iteration(){
  for(int i = 1; i < (width / cellSize)-1; i++){
    for(int j = 1; j < (height / cellSize)-1; j++){
      int sommeCells = cells[i-1][j-1] + cells[i][j-1] + cells[i+1][j-1] + cells[i-1][j] + cells[i+1][j] + cells[i-1][j+1] + cells[i][j+1] + cells[i+1][j+1];
      newCells[i][j] = cells[i][j];
      if((sommeCells < 2 || sommeCells > 3) && cells[i][j] == 1){
        newCells[i][j] = 0;
      }
      if(sommeCells == 3 && cells[i][j] == 0){
        newCells[i][j] = 1;
      }
    }
  }
  cells = newCells;
}

void reset(){
  for(int i = 0; i < (width / cellSize); i++){
    for(int j = 0; j < (height / cellSize); j++){
      if(random(100) > 5){
        cells[i][j] = 0;
      }else{
        cells[i][j] = 1;
      }
    }
  }
}
