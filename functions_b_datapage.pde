// Data Page
void axisText(){
  textAlign(CENTER);
  textSize(18);
  fill(255);
  stroke(255);
  // X AXIS
  line(90, 715, 1130, 715);
  for(int i = 0; i < x_not.length; i++){
    text(x_not[i], 150 + 140 * i, 745);
  }
  
  // Y AXIS
  line(90, 715, 90, 30);
  for(int i = 0; i < y_not.length; i++){
    text(y_not[i], 55, 100 + 140 * i);
  }
  float textX = 30;
  float textY = height/2 - 30;
  
  textSize(20);
  text("Temperature (Kelvin)", width/2, 775);
  
  pushMatrix();
  translate(textX, textY);
  rotate(-HALF_PI);
  text("Luminosity (Sun = 1)",0,0);
  popMatrix(); 
}

void descrText(){
  float textX = width/2;
  float textY = height/2;
  textSize(30);
  rotatedText(textX, textY, "Main Sequence", -15, 15);
  
  textSize(25);
  text("Giants", 890, 308);
  text("Super Giants", 996, 172);
  text("White Dwarfs", 428, 617);
  
}

void infoText(){
  arrow(733, 526, 886, 641);
  rotatedText(780, 600, "Lifetime", 0, 0);
  arrow(1020, 600, 860, 481);
  rotatedText(950, 532, "Mass & Radius", 0, 0);
}

void infoButtons(){
  fill(blue);
  noStroke();
  ellipse(40, 40, 45, 45);
  textFont(avenirHeavy);
  textSize(30);
  fill(255);
  text("i", 40, 50);
}

void learnMoreButton(){  
  textSize(20);
  text("Click to switch to the learning mode", 210, 775);
  
  if(mousePressed && mouseX > 0 && mouseX < 350 && mouseY > 740){
    learnMode = true;
  }
}

void directionLines(){
  stroke(red);
  
  if(mouseX > 90 && mouseY < 715){
    line(90, mouseY, width, mouseY);
    line(mouseX, 715, mouseX, 0);
  }
}

void rotatedText(float textX, float textY, String text, float textX_adj, float textY_adj){
  pushMatrix();
  translate(textX, textY);
  rotate(PI/5);
  fill(255);
  text(text, textX_adj, textY_adj);
  popMatrix();
}

// took from a Processing forum
void arrow(int x1, int y1, int x2, int y2) {
  stroke(255);
  line(x1, y1, x2, y2);
  pushMatrix();
  translate(x2, y2);
  float a = atan2(x1-x2, y2-y1);
  rotate(a);
  line(0, 0, -10, -10);
  line(0, 0, 10, -10);
  popMatrix();
} 
