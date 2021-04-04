double rc = 1.0008875;
double ic = 0;

int maxWidth = 300;
int maxHeight = 300;
int maxI = 100;

int zoom = 4;

double sinh(double a){
  return (pow(exp(1),(float)a)+pow(exp(1),(float)-a))/2;
}

double cosh(double a){
  return (pow(exp(1),(float)a)-pow(exp(1),(float)-a))/2;
}

double[] inverse(double a, double b){
  double na = a / (a*a - b*b);
  double nb = -b / (a*a - b*b);
  return new double[] {na,nb};
}

double[] cosine(double a, double b){
  double na = cos((float)a) * cosh(b);
  double nb = sin((float)a) * sinh(b);
  return new double[] {na, nb};
}

double[] power(double a, double b, int c){
  double na = a;
  double nb = b;
  for(int i = 0; i < c - 1; i++){
    double nna = a * na - b * nb;
    double nnb = a * nb + b * na;
    na = nna;
    nb = nnb;
  }
  return new double[] {na,nb};
}

float r = 0.3;
float g = 0.5;
float b = 0.8;


void setup(){
  size(600,600);
  noStroke();
  fill(0);
}

void draw(){
  background(220);
  for(int i = 0; i < maxWidth; i++){
    for(int j = 0; j < maxHeight; j++){
      double a = (double)i * zoom * 2/(double)maxWidth - zoom;
      double b = (double)j * zoom * 2/(double)maxHeight - zoom;
      for(int p = 0; p < maxI && (a * a + b * b) < 4; p++){
        fill(255-p*255/maxI);
        
        //double nrz = (2 * pow((float)a,4) + 2 * b * b - 8 * a * a * b * b - 4 * a) / (3 * a * a + 3 * b * b) + rc;
        //double niz = (4 * a * a * a * b - 2 * a * b * b * b - 4 * b) / (3 * a * a + 3 * b * b) + ic;
        double nrz = (a * a - b * b)/(a * a * a * a - 2 * a * a * b * b + b * b * b * b) + ic;
        double niz =(- 2 * a * b)/(a * a * a * a - 2 * a * a * b * b + b * b * b * b) + rc * ic;
        a = nrz;
        b = niz;
      
    
  
       }
      rect(width/maxWidth * i,height/maxHeight * j,width/maxWidth,height/maxHeight);
    }
  }
}

void mouseDragged(){
  rc = (double)mouseX * zoom * 2/(double)width - zoom;
  ic = (double)mouseY * zoom * 2/(double)height - zoom;
}
