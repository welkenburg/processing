class pendulum{
  float L,masse,angle,speed,acceleration;
  color pColor;
  
  pendulum(int a, int b, float c, color d){
    L = (float)a;
    masse = (float)b;
    angle = c;
    speed = 0;
    acceleration = 0;
    pColor = d;
  }
  
  
  void move(){
    acceleration =  -g * sin(angle) / L;
    
    stroke(pColor);
    fill(pColor);
    line(0, 0, L * sin(angle), L * cos(angle));
    circle(L * sin(angle), L * cos(angle), masse);  
    angle += speed;
    speed += acceleration;
  }
}

float g = 1;

pendulum pendulums[] = {
  new pendulum(200,10,1,color(0,200,100))
};


void setup(){
  size(600,600);
}

void draw(){
  background(200);
  stroke(100);
  fill(100);
  strokeWeight(2);
  translate(width/2, height/2);
  
  for(int i = 0; i < pendulums.length; i++){
    pendulums[i].move();
  }
  
}
