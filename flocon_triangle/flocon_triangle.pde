float a = 0;

void setup(){
  size(600,600);
}

void draw(){
  background(200);
  translate(width/2,height/2);
  flake(0,0, 100, 10,a);
  a = (a + 0.01) % TWO_PI;
}

float[] midpoint(float xA, float yA, float xB, float yB){
  return new float[] {( xB + xA ) / 2 , ( yB + yA ) / 2};
}

float[] rotateTriangle(float x, float y, float w, float angle){
  float xA = x + w/2 * cos(PI + angle);
  float yA = y - w/2 * sin(PI + angle);
  
  float xB = x + sqrt(w * w * 3/4) * cos(HALF_PI + angle);
  float yB = y - sqrt(w * w * 3/4) * sin(HALF_PI + angle);
  
  float xC = x + w/2 * cos(angle);
  float yC = y - w/2 * sin(angle);
  
  return new float[]{xA,yA,xB,yB,xC,yC};
}

void flake(float x, float y, float w,int iMax, float angle){
  noStroke();
  fill(0);
  if(iMax > 0){
    float radius = w - w / 6;
    for(int i = 0; i < 6; i++){
      float nx = x - sin(i * PI / 3) * radius;
      float ny = y - cos(i * PI / 3) * radius;
      float[] points = rotateTriangle(nx,ny,w,angle + i * PI / 3);
      triangle(points[0],points[1],points[2],points[3],points[4],points[5]);
      
      //for i in range(3):
      //flake(midTriangle,iMax - 1);
      
    }
  }
}
