import peasy.*;
PeasyCam cam;

float x = 0.1;
float y = 0.1;
float z = 0.1;

float a = 0.95;
float b = 0.7;
float c = 0.6;
float d = 3.5;
float e = 0.25;
float f = 0.1;

float dx, dy, dz;
float dt = 0.01;

ArrayList<PVector> points = new ArrayList<PVector>();


void setup() {
  size(500, 500, P3D);
  colorMode(HSB);
  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(1000);
  frameRate(30);
}

void draw() {
  background(0);
  scale(100);
  dx=((z-b) * x - d*y)*dt;
  dy=(d * x + (z-b) * y)*dt;
  dz=(c + a*z - (z*z*z /3) - ((x*x+y*y)*(1+e*z))+f*z*x*x*x)*dt;

  x = x + dx;
  y = y + dy;
  z = z + dz;

  if (key == 'f') {
  } else if (key == 'r') {
  }
  points.add(new PVector(x, y, z));
  scale(1);
  float myColor=0;
  beginShape();
  for (PVector v : points) {
    stroke(myColor, 255, 255);
    strokeWeight(3);
    point(v.x, v.y, v.z);
    myColor += 0.1;
    if (myColor > 255) {
      myColor = 0;
    }
  }
  endShape();
}

