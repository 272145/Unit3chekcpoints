color teal = #22E3C1;
float sliderX;
float shade;

void setup(){
  size(800,600);
  strokeWeight(5);
  stroke(teal);
  fill(teal);
  sliderX = 400;
  shade = 170;
  
}
void draw(){
  background(shade,100,100);
  
  line(400,100,400,500);
  circle(400,sliderX,50);
}

void conSlide(){
  if (mouseX>350&& mouseX<450 && mouseY > 85 && mouseY <525) {
    sliderX = mouseY;
  }
  shade = map(sliderX,100,700,0,255);
}
void mouseDragged(){
  conSlide();
}
void mouseReleased(){
  conSlide();
}
