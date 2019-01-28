ArrayList points;
float x = 0;
int r = 0;
int g = 0;
int b = 0;
float alpha;
int count = 0;
boolean ru, gu, bu, rd, gd, bd;
void setup() {
  background(255);
  size(700, 700, P3D);
  smooth();
  points = new ArrayList();
  strokeWeight(1);
}
void draw() {
  translate(width/2, 0);
  lights();
  if (keyPressed && key == ' ') {
    x = x + 0.5;
  }
  rotateY(x);
  for (int i = points.size() - 1; i >= 0; i--) {
    Point dots = (Point) points.get(i);
    dots.display();
  }
  stroke(r, g, b);
  if (ru == true) {
    r++;
  }
  if (gu == true) {
    g++;
  }
  if (bu == true) {
    b++;
  }
  if (rd == true) {
    r--;
  }
  if (gd == true) {
    g--;
  }
  if (bd == true) {
    b--;
  }
  fill(0, alpha);
  if (count == 50) {
    alpha -= 0.1;
  } else {
    count++;
    alpha += 0.1;
  }
  textAlign(CENTER);
  textSize(15);
  text("'1' adds red, '2' subtracts red, '3' adds green, '4' subtracts green, '5' adds blue, '6' subtracts blue", 0, 20);
  text("'q' canvas is black, 'e' canvas is white, 'a' clears canvas, ' ' rotates drawing", 0, 40);
  println(r+" "+g+" "+b);
}
void mouseDragged() {
  points.add(new Point());
  Point pointz = (Point) points.get(points.size() - 1);
  pointz.setValues(pmouseX - width/2, pmouseY, mouseX - width/2, mouseY);
}
void keyPressed() {
  if (key == 'a') {
    setup();
  }
  if (key == '1') {
    ru = true;
  }
  if (key == '2') {
    rd = true;
  }
  if (key == '3') {
    gu = true;
  }
  if (key == '4') {
    gd = true;
  }
  if (key == '5') {
    bu = true;
  }
  if (key == '6') {
    bd = true;
  }
  if (key == 'q') {
    background(0);
  }
  if (key == 'e') {
    background(255);
  }
}
void keyReleased() {
  x = 0;
  if (key == '1') {
    ru = false;
  }
  if (key == '2') {
    rd = false;
  }
  if (key == '3') {
    gu = false;
  }
  if (key == '4') {
    gd = false;
  }
  if (key == '5') {
    bu = false;
  }
  if (key == '6') {
    bd = false;
  }
}
class Point {  // The rotation tool
  float a, b, x, y;
  Point() {
  }
  void setValues(float apos, float bpos, float xpos, float ypos) {
    a = apos;
    b = bpos;
    x = xpos;
    y = ypos;
  }
  void display() {
    line(a, b, x, y);
  }
}