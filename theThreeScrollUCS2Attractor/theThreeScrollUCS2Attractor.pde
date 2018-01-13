import peasy.*;
PeasyCam cam;

float x = 0.1;
float y = 0.1;
float z = 0.1;

float a = 40;
float b = 55;
float c = 1.883;
float d = 0.16;
float e = 0.65;
float f = 20;

float dx, dy, dz;
float dt = 0.001;

ArrayList<PVector> points = new ArrayList<PVector>();

void setup() {
  size(600, 600, P3D);
  colorMode(HSB);
  cam = new PeasyCam(this, 1000);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(5000);
  frameRate(30);
}

void draw() {
  background(0);
  scale(10);
  
  dx=(a*(y-x)+d*x*z)*dt;
  dy=(b*x-x*z+f*y)*dt;
  dz=(c*z+x*y-e*x*x)*dt;
  x = x + dx;
  y = y + dy;
  z = z + dz;
  points.add(new PVector(x, y, z));


  float myColor=0;
  beginShape();
  for (PVector v : points) {

    stroke(myColor, 255, 255);
    strokeWeight(3);
    point(v.x, v.y, v.z);
    //    PVector offset = PVector.random3D();
    //    offset.mult(0.001);
    //    v.add(offset);
    myColor += 0.1;
    if (myColor > 255) {
      myColor = 0;
    }
  }
  endShape();
}

