FloatList path = new FloatList();
float coefs[] = {1,2};
float maxradius = 100;
float maxangle = 0;

void setup(){
  size(1000,600);
}

void draw(){
  background(200);
  stroke(0);
  strokeWeight(1);
  translate(height/2,height/2);
  fourier(0,0,0,coefs.length - 1);
  maxangle += 0.02;
  
  stroke(0);
  strokeWeight(2);
  noFill();
  beginShape();
  for(int i = 0; i < path.size(); i+=2){
    vertex(path.get(i),path.get(i+1));  
  }
  endShape();
  
  stroke(0,255,0);
  beginShape();
  for(int i = 0; i < path.size(); i+=2){
    vertex(maxradius * 2 + i/2,path.get(path.size() - i - 1));
  }
  endShape();
  
  stroke(100,100,100);
  line(path.get(path.size() - 2), path.get(path.size() - 1), maxradius * 2, path.get(path.size() - 1));
  
}

void fourier(int coef,float x, float y, int n){
  if(n > -1){
    float radius = maxradius / coefs[coef];
    float angle = maxangle * coefs[coef];
    noFill();
    stroke(0);
    circle(x,y, radius * 2);
    line(x, y, x + radius * cos(angle), y + radius * sin(angle));
    
    noStroke();
    fill(255,0,0);
    circle(x + radius * cos(angle), y + radius * sin(angle),5);
    
    fourier(coef + 1,x + radius * cos(angle), y + radius * sin(angle),n - 1);
    
    if(n == 0){
      fill(255,0,0);
      circle(x + radius * cos(angle), y + radius * sin(angle),10);
      
      path.append(x + radius * cos(angle));
      path.append(y + radius * sin(angle));
    }
    
  }
}
