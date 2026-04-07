color blue=#6EC1E4;
color green=#7ED957;
color pink=#FF8FAB;
color grey=#B2ABAB;
color selectedColor;

void setup(){
  size(800,500);
  strokeWeight(4);
  stroke(#333333);
  selectedColor=blue;
}

void draw(){
  background(#F2F2F2);
if(dist(200,80,mouseX,mouseY) <40){
    fill(grey);
  }else{
  fill(blue);
  }
  circle(200,80,80);
if(dist(400,80,mouseX,mouseY) <40){
    fill(grey);
  }else{
  fill(green);
  }

  circle(400,80,80);

  if(dist(600,80,mouseX,mouseY) <40){
    fill(grey);
  }else{
  fill(green);
  };
  circle(600,80,80);

  fill(selectedColor);
  rect(200,180,400,220,20);
}

void mousePressed(){
  if(dist(mouseX,mouseY,200,80)<40){
    selectedColor=blue;
  }
  if(dist(mouseX,mouseY,400,80)<40){
    selectedColor=green;
  }
  if(dist(mouseX,mouseY,600,80)<40){
    selectedColor=pink;
  }
  
}
