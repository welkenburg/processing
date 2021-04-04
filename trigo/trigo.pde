float m = 100;
float rad = 0;
int circleWidth = 100;
int offset = 20;
boolean overPoint = false;
boolean locked = false;
float turn = 3;
color sinColor = color(100,255,100);
color cosColor = color(100,100,255);
int textOffset = 10;



float hypothenuse(float x,float y){
  return sqrt(x*x + y*y);
}

void setup(){
  size(500,500);
  textFont(createFont("arial", 30));
}

void draw(){
  background(220);
  
  cercleTrigo();
  
  fill(0);
  text("m = "+ turn + " * 2PI + PI * "+rad/PI,textOffset,textAscent()+textDescent());
  fill(cosColor);
  text("cos(m) = "+cos(m),textOffset,height-textAscent()-textDescent()-textOffset);
  fill(sinColor);
  text("sin(m) = "+sin(m),textOffset,height-textOffset);
  
  //contact de la souris et du point
  if (width/2+circleWidth * cos(m) - 5 < mouseX && mouseX < width/2+circleWidth * cos(m) + 5 && 
  height/2+circleWidth * sin(m) - 5 < mouseY && mouseY < height/2+circleWidth * sin(m) + 5){
    overPoint = true;
  }else{
    overPoint = false;
  }
}


void cercleTrigo(){
  noFill();
  stroke(0);
  strokeWeight(1);
  circle(width/2,height/2,circleWidth*2);
  line(width/2+circleWidth+offset,height/2,width/2-circleWidth-offset,height/2);
  line(width/2,height/2+circleWidth+offset,width/2,height/2-circleWidth-offset);
  
  drawPoint(m);
  //drawPoint(m+PI/2);
  //drawPoint(m+PI);
  //drawPoint(m-PI/2);
  
  drawSin(m,0,height/2,-50);
  drawCos(m,0,height/2,-50);
  
}

void drawPoint(float m){
  
  //cos line
  strokeWeight(2);
  stroke(sinColor);
  line(width/2+circleWidth * cos(m),height/2+circleWidth * sin(m),width/2+circleWidth * cos(m),height/2);
  
  //sin line
  strokeWeight(2);
  stroke(cosColor);
  line(width/2+circleWidth * cos(m),height/2+circleWidth * sin(m),width/2,height/2+circleWidth * sin(m));
  
  //m point
  strokeWeight(10);
  stroke(200,200,0);
  point(width/2+circleWidth * cos(m),height/2+circleWidth * sin(m));
}

void drawSin(float m, float x, float y, float omega){
  float division = 25;
  strokeWeight(2);
  stroke(sinColor);
  beginShape(LINES);
    for(int i = 0; i < (int)(m * division);i++){
      vertex(i+x, omega * sin(i/division)+y);
      vertex(i+1+x,omega * sin((i+1)/division)+y);
    }
  endShape();
}

void drawCos(float m, float x, float y, float omega){
  float division = 25;
  strokeWeight(2);
  stroke(cosColor);
  beginShape(LINES);
    for(int i = 0; i < (int)(m * division);i++){
      vertex(i+x, omega * cos(i/division)+y);
      vertex(i+1+x,omega * cos((i+1)/division)+y);
    }
  endShape();
}

void mousePressed(){
  if(overPoint){
    locked = true;
  }
}

void mouseDragged(){
  if(locked){
    float h = hypothenuse(mouseY - height/2,mouseX - width/2);
    if(mouseY - height/2 >= 0){
       m = acos((float)(mouseX - width/2)/h) + turn * 2 * PI;
       rad = acos((float)(mouseX - width/2)/h);
    }else{
      m = PI + acos(-(float)(mouseX - width/2)/h) + turn * 2 * PI;
      rad = PI + acos((float)(mouseX - width/2)/h);
    }
  }
}

void mouseReleased(){
  locked = false;
}
