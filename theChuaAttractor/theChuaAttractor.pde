import peasy.*;
PeasyCam cam;

float x = 0.1;
float y = 0.1;
float z = 0.1;

float a = 15.6;
float b = 1;
float c = 25.58;
float d = -1;
float e = 0;

float dx, dy, dz;
float dt = 0.01;

ArrayList<PVector> points = new ArrayList<PVector>();

void setup() {
  size(600, 600, P3D);
  colorMode(HSB);
  cam = new PeasyCam(this, 1000);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(3000);
  frameRate(30);
}

void draw() {
  background(0);
  scale(10);
  
  dx=(a*(y-x-(e*x+(d+e)*(abs(x+1)-abs(x-1)))))*dt;
  dy=(b*(x-y+z))*dt;
  dz=(-c*y)*dt;
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

