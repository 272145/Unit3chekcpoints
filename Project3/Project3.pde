PImage spike;
color currentColor = color(0);
float brushSize = 5;
boolean drawing = true;

boolean stampCircleOn = false;
boolean stampSquareOn = false;

float sliderX = 50;
float sliderY = 70;
float sliderW = 200;
float sliderHandleX = sliderX;

int canvasY = 120;

void setup() {
  size(800, 600);
  background(255);
  spike = loadImage("images.jpg");
  
}

void draw() {
  drawUI();
}

void drawUI() {
  strokeWeight(1);
  fill(230);
  noStroke();
  rect(0, 0, width, canvasY);

  circleButton(color(255, 0, 0), 50, 40, 30);
  circleButton(color(0, 255, 0), 100, 40, 30);
  circleButton(color(0, 0, 255), 150, 40, 30);
  circleButton(color(255, 255, 0), 200, 40, 30);
  circleButton(color(255, 0, 255), 250, 40, 30);
  circleButton(color(0, 255, 255), 300, 40, 30);

  rectButton(color(180), 400, 20, 80, 40);
  

  fill(0);
  textAlign(CENTER);
  text("SQUARE", 440, 75);
  text("SPIKE", 520, 75);

  rectButton(color(200), 620, 20, 80, 40);
  fill(0);
  text("NEW", 660, 45);
  image(spike,500,0,100,65);
  drawSlider();
  drawIndicator();
}

void drawSlider() {
  stroke(0);
  line(sliderX, sliderY, sliderX + sliderW, sliderY);

  if (dist(mouseX, mouseY, sliderHandleX, sliderY) < 10) {
    fill(150);
  } else {
    fill(100);
  }

  circle(sliderHandleX, sliderY, 15);
  brushSize = map(sliderHandleX, sliderX, sliderX + sliderW, 1, 50);

  fill(0);
  textAlign(LEFT);
  text("SIZE", sliderX, sliderY - 10);
}

void drawIndicator() {
  fill(currentColor);
  stroke(0);
  strokeWeight(brushSize);
  circle(750, 60, 40);
  strokeWeight(1);

  fill(0);
  textAlign(CENTER);
  text("CURRENT", 750, 100);
}

void mouseDragged() {
  if (mouseY < canvasY && abs(mouseY - sliderY) < 20) {
    sliderHandleX = constrain(mouseX, sliderX, sliderX + sliderW);
  }

  if (mouseY > canvasY && !stampCircleOn && !stampSquareOn) {
    stroke(currentColor);
    strokeWeight(brushSize);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (mouseY > canvasY) {
    if (stampCircleOn) {
      fill(currentColor);
      noStroke();
      image(spike, mouseX, mouseY,100,100 );
    }
    if (stampSquareOn) {
      fill(currentColor);
      noStroke();
      rect(mouseX, mouseY, brushSize * 2, brushSize * 2);
    }
  }
}

void mousePressed() {
  checkColorButton(color(255, 0, 0), 50, 40, 30);
  checkColorButton(color(0, 255, 0), 100, 40, 30);
  checkColorButton(color(0, 0, 255), 150, 40, 30);
  checkColorButton(color(255, 255, 0), 200, 40, 30);
  checkColorButton(color(255, 0, 255), 250, 40, 30);
  checkColorButton(color(0, 255, 255), 300, 40, 30);

  if (overRect(400, 20, 80, 40)) {
    stampSquareOn = !stampSquareOn;
    stampCircleOn = false;
  }

  if (dist(mouseX, mouseY, 520, 40) < 20) {
    stampCircleOn = !stampCircleOn;
    stampSquareOn = false;
  }

  if (overRect(620, 20, 80, 40)) {
    background(255);
  }

  
}

void circleButton(color c, float x, float y, float r) {
  if (dist(mouseX, mouseY, x, y) < r/2) {
    stroke(0);
    strokeWeight(3);
  } else {
    noStroke();
  }
  fill(c);
  circle(x, y, r);
}

void rectButton(color c, float x, float y, float w, float h) {
  if (overRect(x, y, w, h)) {
    stroke(0);
    strokeWeight(3);
  } else {
    noStroke();
  }
  fill(c);
  rect(x, y, w, h);
}

void checkColorButton(color c, float x, float y, float r) {
  if (dist(mouseX, mouseY, x, y) < r/2) {
    currentColor = c;
    stampCircleOn = false;
    stampSquareOn = false;
  }
}

boolean overRect(float x, float y, float w, float h) {
  return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
}
