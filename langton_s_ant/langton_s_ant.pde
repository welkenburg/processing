int tilesCount = 80;
int tilesSize = 10;  

boolean[][] board = new boolean[tilesCount][tilesCount];

class Vector2d{
  int x;
  int y;
  
  Vector2d(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  Vector2d add(Vector2d n){
    this.x += n.x;
    this.y += n.y;
    return this;
  }
  
  Vector2d mod(int m){
    this.x %= m;
    if(this.x < 0) this.x += m;
    this.y %= m;
    if(this.y < 0) this.y += m;
    return this;
  }
}

class Ant{
  Vector2d position;
  int angle = 0;
  
  Ant(Vector2d position){
    this.position = position;
  }
  
  void updatePosition(){
    if( board[this.position.x][this.position.y]) angle = (angle + 1) % 4;
    if(!board[this.position.x][this.position.y]) angle = (angle - 1);
    if(angle < 0) angle += 4;
    board[this.position.x][this.position.y] = !board[this.position.x][this.position.y];
    
    position.add(directions[angle]);
    position.mod(tilesCount);
    
  }
}

Vector2d[] directions = {new Vector2d(0,-1), new Vector2d(1,0), new Vector2d(0,1), new Vector2d(-1,0)};

Vector2d center = new Vector2d(round(tilesCount / 2),round(tilesCount / 2));
Ant[] ants = {new Ant(center)};

void setup(){
  size(800,800);
}

int iterations = 0;

void draw(){
  background(255);
  
  fill(0);
  for(int i = 0; i < tilesCount; i++){
    for(int j = 0; j < tilesCount; j++){
      if(board[i][j]){
        rect(i * tilesSize, j * tilesSize, tilesSize, tilesSize);
      }
    }
  }
  
  fill(255,0,0);
  for(int a = 0; a < ants.length; a++){
    ants[a].updatePosition();
    rect(ants[a].position.x * tilesSize, ants[a].position.y * tilesSize, tilesSize, tilesSize);
  }
  
  iterations ++;
  println(iterations);
}
