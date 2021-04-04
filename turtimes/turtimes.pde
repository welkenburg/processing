int tilesCount = 100;
int tilesSize = 8;  

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

class Turmite{
  Vector2d position;
  int[][][] brain;
  int angle = 0;
  int state = 0;
  
  Turmite(Vector2d position, int[][][] brain){
    this.position = position;
    for(int i = 0; i < brain.length; i++){
      for(int j = 0; j < brain[i].length; j++){
        if(brain[i][j].length > 0){
               if(brain[i][j][1] == 1) brain[i][j][1] =  0;
          else if(brain[i][j][1] == 2) brain[i][j][1] =  1;
          else if(brain[i][j][1] == 4) brain[i][j][1] =  2;
          else if(brain[i][j][1] == 8) brain[i][j][1] = -1;
        }
      }
    }
    this.brain = brain;
  }
  
  void updatePosition(){
    
    int[] behavior = brain[state][int(board[this.position.x][this.position.y])];
    
    board[this.position.x][this.position.y] = boolean(behavior[0]);
    
    angle = (angle + behavior[1]) % 4;
    if(angle < 0) angle += 4;
    
    state = behavior[2];
    
    position.add(directions[angle]);
    position.mod(tilesCount);
    
  }
}

Vector2d[] directions = {new Vector2d(0,-1), new Vector2d(1,0), new Vector2d(0,1), new Vector2d(-1,0)};

Vector2d center = new Vector2d(round(tilesCount / 2),round(tilesCount / 2));

int[][][] brain = {{{1, 8, 0}, {1, 2, 1}}, {{0, 2, 0}, {0, 8, 1}}};

Turmite turmite = new Turmite(center,brain);

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
   turmite.updatePosition();
   rect(turmite.position.x * tilesSize, turmite.position.y * tilesSize, tilesSize, tilesSize);
  
  iterations ++;
  if(iterations % 1000 == 0) println(iterations/1000);
}
