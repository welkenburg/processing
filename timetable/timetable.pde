float coeficient = 2;
int radius = 200;

void setup(){
  size(500,500);
  colorMode(HSB);
  textFont(createFont("arial", 36));
}

void draw(){
  background(200);
  drawPoint(100);
  if(mousePressed){
    coeficient += ((float)mouseX - (float)width/2) / (10 *(float)width / 2) + ((float)mouseY - (float)height/2) / (10 *(float)height / 2);
  }
  text(coeficient,0,textAscent()+textDescent());
  
}

void drawPoint(int Pointnumber){
  strokeWeight(2);
  stroke(abs(coeficient*50)%255,200,200);
  for(int i=0;i<Pointnumber;i=i+1) { 
    line(width/2+cos(i*2*PI/Pointnumber)*radius,height/2+sin(i*2*PI/Pointnumber)*radius,width/2+cos(i*coeficient*2*PI/Pointnumber)*radius,height/2+sin(i*coeficient*2*PI/Pointnumber)*radius);
  }
}
