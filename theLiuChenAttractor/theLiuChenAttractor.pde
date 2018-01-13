import peasy.*;
PeasyCam cam;

float x = 0.1;
float y = 0.1;
float z = 0.1;

float a = 2.4;
float b = -3.78;
float c = 14;
float d = -11;
float e = 4;
float f = 5.58;
float g = 1;


float dx, dy, dz;
float dt = 0.0001;

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
  scale(100);
  
  dx=(a*y+b*x+c*y*z)*dt;
  dy=(d*y-z+e*x*z)*dt;
  dz=(f*z+g*x*y)*dt;
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

