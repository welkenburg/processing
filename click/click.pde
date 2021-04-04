int Xoffset = 0;
int Yoffset = 0;

void setup(){
  size(500,500);
  textFont(createFont("arial", 40));
}

void draw(){
  background(0);
  if(mousePressed){
    background(random(255),random(255),random(255));
    Xoffset += random(-3,3);
    Yoffset += random(-3,3);
  }
  text("CLICK !",width/2+Xoffset,Yoffset+height/2);
}
