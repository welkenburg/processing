float m = 0;
int circleWidth = 100;
int axesOffset = 20;
int textOffset = 5;

//colors
color sinColor = color(0,255,100);
color cosColor = color(0,100,255);
color pointColor = color(255,100,0);

float hypothenuse(float x,float y){
  return sqrt(x*x + y*y);
}

void setup(){
  size(500,500);
}

void draw(){
  background(200);
  fill(0);
  int turn = (int)(m / (2 * PI));
  float angle = m - turn * 2 * PI;
  text(turn + " * 2π + π * "+angle/PI,textOffset,textAscent()+textDescent());
  
  translate(width/2,height/2);
  drawCircle();
  drawM();
  
  m+= 0.01;
}

void drawCircle(){
  noFill();
  stroke(0);
  strokeWeight(1);
  
  circle(0,0,circleWidth*2);
  line(circleWidth+axesOffset, 0,
        -circleWidth-axesOffset,0);
  line(0,circleWidth+axesOffset,
        0,-circleWidth-axesOffset);
  
  fill(0);
  textFont(createFont("arial", 20));
  text("x",circleWidth+axesOffset+textOffset,textOffset);
  text("y",-textOffset,-circleWidth-axesOffset-textOffset);

}

void drawM(){
  //cos line
  strokeWeight(4);
  stroke(sinColor);
  line(circleWidth * cos(m),circleWidth * -sin(m),
        circleWidth * cos(m),0);
  
  //sin line
  strokeWeight(4);
  stroke(cosColor);
  line(circleWidth * cos(m),circleWidth * -sin(m),
        0,circleWidth * -sin(m));
  
  //point
  strokeWeight(10);
  stroke(pointColor);
  point(circleWidth * cos(m),circleWidth * -sin(m));
  
  
}
