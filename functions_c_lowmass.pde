// Low mass
void additionalDesignControls(){
    fill(0);
    rect(150, height/2, 300, height);
    rect(width - 150, height/2, 300, height);
    fill(yellow);
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(HALF_PI);
    arc(0, 0, sun_diameter, sun_diameter, 0, PI);
    popMatrix();
    
    fill(255);
    textAlign(LEFT);
    textFont(avenir);
    text(sun_text[0], width/2 - 10, height/2 + 350);
    text(sun_text[1], width/2 + 330, height/2 - 20);
    text(sun_text[2], width/2 + 330, height/2 + 20);
}

void lmrgexplosion(){
  if(counter >= arrows.length - 10){
      sun_text[0] = " ";
      sun_text[1] = "Gravity wins";
      sun_text[2] = "Hydrogen runs\nout and fuel stops";
  }
  if(counter >= arrows.length){
      fill(yellow);
      ellipse(width/2, height/2, sun_diameter, sun_diameter);
      
      if(sun_diameter > 50 && shrink){
        sun_diameter -= 10;
      }
      if(sun_diameter <= 50){
        shrink = false;
        fill(orange);
        ellipse(width/2, height/2, sun_explosion, sun_explosion);
        textAlign(CENTER);
        fill(0);
        text("Temperature dramatically goes up -> Radius increases -> Giant!\n\n" + 
        "When this happens to our Sun in 5-7 billion years,\nit will grow all the" + 
        "way to reach the Earth's Orbit,\nand will likely burn everything on our" + 
        "planet if\nscientists do not come up with something to prevent that", width/2, 100);
        textSize(18);
        text("See this dot right here?\nThis is the current size of our sun\n" 
        + "in comparison to its Red Giant future", width/2 - 100, height/2);
        fill(yellow);
        ellipse(660, 358, 30, 30);
      }
      if(sun_explosion < 1100){
        sun_explosion += 10;
      }
      if(sun_explosion > 1000){
        controlText(675);
      }
  }  
}

void rotatedNebula(float rotSpeed, float img_x, float img_y){
  pushMatrix();
  translate(.5 * width, .3 * height);
  rotate(rotation);
  image(pnebulashape, 0, 0, img_x, img_y);
  rotation += rotSpeed;
  popMatrix();
}

void textaboutNebula(){
  textFont(avenir);
  fill(255);
  textSize(20);
  text("When fusion finally stops, outer layers \nfall in again due to gravity and get ejected into space", width/2, height/2 + 125);
  text("What forms is one of the most beautiful \nobjects in space, a Planetary Nebula —", width/2, height/2 + 200);
  text(pn_descr, width/2, height/2 + 275);
}

void textaboutWD(){
  textFont(avenir);
  fill(255);
  textSize(20);
  text("Our Sun is now a White Dwarf!\nIt is as big as Earth but extremely dense —\na teaspoon of that density would weigh like a small truck.", width/2, height/2 + 125);
}
