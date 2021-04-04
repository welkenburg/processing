boolean running = false;
float gravity = 9.80665;

class pendulum{
  float stringX = 0;
  float stringY = 0;
  float angle = 0;
  float stringLength = 200;
  float masse = 10; //in kg
  float px;
  float py;
  
  void calculatePosition(){
    this.px = this.stringX + sin(this.angle) * stringLength;
    this.py = this.stringY + cos(this.angle) * stringLength;
  }

}

pendulum pendule = new pendulum();

void setup(){
  size(600, 600);
}

void draw(){
  translate(width/2, height/8);
  background(200);
  
  pendule.calculatePosition();
  line(pendule.stringX,pendule.stringY,pendule.px,pendule.py);
  circle(pendule.px,pendule.py,10);
  
  if(running){
    
  }
}

void mouseDragged(){
  float x = mouseX - width/2;
  float y = mouseY - height/8;
  if(y != 0){
    pendule.angle =  atan(x/y);
  }else if(x != 0){
    pendule.angle =  PI/2 - atan(y/x);
  }
}
