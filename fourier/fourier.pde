float v = 30;
float angle = 0;

FloatList vertexes = new FloatList();
float sizes[] = {2,4,1};

void setup(){
  size(700,700);
  smooth(2);
}

void draw(){
  translate(width/2,height/2);
  background(200);
  noFill();
  
  PShape path = createShape();
  path.beginShape(LINES);
  path.strokeWeight(5);
  colorMode(HSB);
  
  for(int i = 0; i < vertexes.size() / 2 - 2; i++){
    path.stroke(255 * i / (vertexes.size() / 2 - 2),255,255);
    path.vertex(vertexes.get(i*2),vertexes.get(i*2+1));
    path.vertex(vertexes.get((i+1)*2),vertexes.get((i+1)*2+1));
  }
  
  path.endShape();
  shape(path);
  //if(angle > 3*PI) {
  //  angle = 0;
  //  vertexes = new FloatList();
  //}
  
  fourierCircle(0,0,100,angle,sizes.length - 1);
  angle += 0.001 * v;
}

void fourierCircle(float x, float y, float r,float angle, int n){
  strokeWeight(1);
  stroke(0);
  circle(x,y,r*2);
  line(x,y,x+r*cos(angle),y+r*sin(angle));
  if (n > 0){
    n--;
    fourierCircle(x+r*cos(angle),y+r*sin(angle),r/sizes[n],angle,n);
  }
  else if(n == 0){
    vertexes.append(x+r*cos(angle));
    vertexes.append(y+r*sin(angle));
    strokeWeight(10);
    stroke(255);
    point(x+r*cos(angle),y+r*sin(angle));
    
  }
}
