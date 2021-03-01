// API Declarators
String[] search_queries = {"planetary_Nebula", "supernova"};
String link = "http://hubblesite.org/api/v3/glossary/";
String pn_descr, pn_descr2;

// Objects-related measurements
float[] radii_s = {100, 80, 60, 70, 50, 40, 35, 30, 25};
float[] x_axis_g = {583, 715, 914, 1090, 1145, 747, 854, 842, 960, 1043};
float[] y_axis_g = {76, 74, 81, 65, 198, 259, 231, 379, 362, 295};
float[] radii_g = {94, 100, 106, 115, 70, 85, 88, 92, 82, 90};
float[] x_axis_wd = {289, 373, 456, 529, 620, 237, 319, 448, 538, 610, 346, 502};
float[] y_axis_wd = {419, 430, 421, 455, 488, 507, 507, 507, 534, 537, 563, 567};

color[] star_color = {#03256C, #004BA8, #3772FF, #CCD8E8, #FDFAB6, #FDCA40, #E57A3B, #CC2936};
float speed = 5;
color red = #CC2936;
color beige = #FDFAB6;
color blue = #03256C;
color yellow = #FDCA40;
color orange = #E57A3B;
color lightblue = #CCD8E8;

// Data page objects
Star[] stars;
int ng = x_axis_g.length;
int nwd = x_axis_wd.length;
Giant[] giants = new Giant[ng];
WD[] white_dwarfs = new WD[nwd];

// Low mass path
Arrow[] arrows = new Arrow[80];
int counter = 0;
String[] sun_text = {"Sun", "Gravity", "Pressure"};
float sun_diameter = 600;
float sun_explosion = 20;
Boolean shrink = true;
int neb_img_w = 50;
int neb_img_h = 50;
float rotation = 0;
float neb_shape_w = 300;
float neb_shape_h = 421;
String[] blackHolePage = {"Do you think our sun will become a Black Hole?", " ", "Yes", "No"};
// White Dwarf movement
float x1 = -150;
float x2 = 1350;
float sn_expl = 200;

int ns;
float[] x_axis_f;
float[] y_axis_f;

// Axis notation
int[] x_not = {30000, 20000, 10000, 7000, 6000, 4000, 3000};
String[] y_not = {"10000", "100", "1", "0.001", "0.0001"};

// Page control booleans
Boolean dataPage = true;
Boolean learnMode = false;
Boolean highMass = false;
Boolean lowMass = false;
Boolean infoPage = false;
int lm_counter = 0;

// PType variables
PFont avenir;
PFont avenirHeavy;
PShape triangle;
PShape triangleLeft;
PShape triangleRight;
PImage pnebulashape;
PImage planetarynebula;
PImage blackhole;

//__________________________________________________________________________________________________________

void setup(){
  size(1200, 800);
  textAlign(CENTER);
  rectMode(CENTER);
  shapeMode(CENTER);
  imageMode(CENTER);
  cursor(CROSS);
  avenir = loadFont("Avenir-Book-24.vlw");
  avenirHeavy = loadFont("Avenir-Heavy-24.vlw");
  triangle = loadShape("triangle.svg");
  triangleRight = loadShape("triangle_r.svg");
  triangleLeft = loadShape("triangle_l.svg");
  planetarynebula = loadImage("cateye.png");
  pnebulashape = loadImage("cateye_shape.png");
  blackhole = loadImage("black-hole-photo.png");
  
  getAPIData();
  getArrayData();
  ns = x_axis_f.length;
  
  stars = new Star[ns];
  
  for(int i = 0; i < ns; i++){
    stars[i] = new Star(x_axis_f[i], y_axis_f[i], i);
  }
  for(int i = 0; i < ng; i++){
    giants[i] = new Giant(x_axis_g[i], y_axis_g[i], i);
  }
  for(int i = 0; i < nwd; i++){
    white_dwarfs[i] = new WD(x_axis_wd[i], y_axis_wd[i], i);
  }
  for(int i = 0; i < arrows.length; i++){
    arrows[i] = new Arrow(i);
  }
}

void draw(){
  background(0);
  textFont(avenir);
  
  // First page 
  if(dataPage){
    stroke(255);
    strokeWeight(1);
    noFill();
    bezier(100, 100, 692, 226, 710, 500, 1107, 700);
    
    axisText();
    
    for(int i = 0; i < ns; i++){
      stars[i].design();
      stars[i].move_into_place();
    }
    for(int i = 0; i < ng; i++){
      giants[i].design();
      giants[i].move_into_place();
    }
    for(int i = 0; i < nwd; i++){
      white_dwarfs[i].design();
      white_dwarfs[i].move_into_place();
    }
    for(int i = 0; i < ns; i++){
      stars[i].detect_position(i);
    }
    descrText();
    directionLines();
    infoText();
    infoButtons();
   
   if(!learnMode){
     learnMoreButton();
   }
  }
  
  if(learnMode){
    halfAndHalf();
  }
  
  if(infoPage){
    fill(0, 200);
    rect(width/2, height/2, width, height);
    textFont(avenirHeavy);
    fill(255);
    textSize(30);
    text("The information page is in development!", width/2, height/2 - 200);
    
    strokeWeight(5);
    stroke(255);
    line(width - 60, 20, width - 20, 60);
    line(width - 20, 20, width - 60, 60);
  }
  
  if(lowMass && lm_counter == 0){
    background(0);
    fill(yellow);
    ellipse(width/2, height/2, sun_diameter, sun_diameter);
    
    for(int i = 0; i < arrows.length; i++){
      if(!arrows[i].outofrange){
        arrows[i].move();
      }
      if(arrows[i].x_pos1 >= width/2 + 330){
        arrows[i].outofrange = true;
        arrows[i].x_pos1 = -50;
        counter++;
      }
    }
    
    additionalDesignControls();
    lmrgexplosion();
  }
  
  
  if(lowMass && lm_counter >= 1 && lm_counter <= 5){
    axisText();
    for(int i = 0; i < ng; i++){
      giants[i].design(x_axis_g[i]);
      giants[i].position_no_movement();
    }
    for(int i = 0; i < nwd; i++){
      white_dwarfs[i].design(x_axis_wd[i]);
      white_dwarfs[i].position_no_movement();
    }
    
    for(int i = 0; i < ns; i++){
      stars[i].design();
      stars[i].position_no_movement();
      
      if(i == 14){
        if(lm_counter == 1){
          if(stars[i].y_pos >= 100){
            stars[i].x_pos += .85;
            stars[i].y_pos -= .5;
          }
          if(stars[i].radius < 94){
            stars[i].radius += .3;
          }
          if(stars[i].y_pos > 300){
            text("Subgiant", 769, 331);
          }
          if(stars[i].y_pos > 200){
            text("Red Giant", 893, 205);
          }
          controlText(675);
        }
        
        if(lm_counter == 2){
           stars[i].x_pos = 1120;
           stars[i].y_pos = 100;
           stars[i].radius = 94;
           text("Double shell-\nburning Red Giant", 994, 106);
           controlText(675);
        }
        
        if(lm_counter == 3){
          if(stars[i].x_pos >= width/2 - 60){
            stars[i].x_pos -= 1.2;
          }
          if(stars[i].radius > 60){
            stars[i].radius -= .1;
          }
          controlText(675);
        }
        
        if(lm_counter == 4){
           stars[i].x_pos = 540;
           stars[i].y_pos = 100;
           stars[i].radius = 60;
           text("Planetary Nebula", width/2 - 50, 200);
           controlText(675);
        }
        
        if(lm_counter == 5){
          if(stars[i].radius >= 10){
            stars[i].radius += random(-1.2, .9);
          }
          if(stars[i].radius < 10){
            image(planetarynebula, stars[i].x_pos, stars[i].y_pos, neb_img_w, neb_img_h);
          }
          if(neb_img_w < 900){
            neb_img_w += 1.3;
            neb_img_h += 1.3;
          if(stars[i].y_pos < height/2 && stars[i].radius < 10){
            stars[i].y_pos += .1;
          }
            controlText(675);
          }
        }
      }
    }
  }
  
  if(lowMass && lm_counter == 6){
    rotatedNebula(.02, 300, 421);
    textaboutNebula();
    controlText(750);
  }
  
  if(lowMass && lm_counter == 7){
    rotatedNebula(.04, neb_shape_w, neb_shape_h);
    
    if(neb_shape_w > 1){
      neb_shape_w -= .5;
      neb_shape_h -= .7;
    }
    if(neb_shape_w < 100){
      fill(lightblue);
      ellipse(.5 * width, .3 * height, 200, 200);
      textaboutWD();
      controlText(675);
    }
  }
    
   if(lowMass && lm_counter == 8){
     for(int i = 0; i < nwd; i++){
      white_dwarfs[i].design(x_axis_wd[i]);
      white_dwarfs[i].position_no_movement();
      white_dwarfs[i].arrow(i);
    }
    axisText();
    fill(lightblue);
    ellipse(.5 * width, .3 * height, 200, 200);
    controlText(675);
   
   }
   
   if(lowMass && lm_counter == 9){
     image(blackhole, width/2, 300);
     textFont(avenir);
     fill(255);
     text(blackHolePage[0], width/2, height/2 + 100);
     text(blackHolePage[1], width/2, height/2 + 250);

     if(mouseX > width/2 - 150 && mouseX < width/2 - 50){
       fill(lightblue, 150); 
     }else{fill(lightblue);}
     text(blackHolePage[2], width/2 - 100, height/2 + 250);
     
     if(mouseX > width/2 + 50 && mouseX < width/2 + 150){
       fill(lightblue, 150); 
     }else{fill(lightblue);}
     text(blackHolePage[3], width/2 + 100, height/2 + 250);
     
     controlText(740);
   }
  
   if(lowMass && lm_counter == 10){
     fill(lightblue);
     noStroke();
     if(x1 <= width/2){
       x1 += 8;
     }
     if(x2 >= width/2){
       x2 -= 8;
     }
     ellipse(x1, height/2, 200, 200);
     ellipse(x2, height/2, 200, 200);
     if(x2 - x1 < 5){
       fill(255);
       ellipse(width/2, height/2, sn_expl, sn_expl); 
     }
     if(sn_expl <= 2000){
       sn_expl += 5;
     }
     if(sn_expl >= 900){
       fill(0);
       textSize(20);
       text("If two White Dwarfs from a close binary system\ncollide, a Supernova explosion happens!\n" 
       + "A Supernova explosion is as luminous as billions\nof Suns combined.\nSupernova –", width/2, height/2 - 100);
       textSize(12);
       text(pn_descr2, width/2, height/2 + 50);
       
       textFont(avenirHeavy);
      textSize(20);
      text("Use the Right keyboard arrow to go back to the Diagram", width/2, 675);
     }
   }
  
  if(highMass){
    background(0);
    textFont(avenirHeavy);
    fill(255);
    textSize(30);
    text("Stay tuned!\nThe biggest Red Giants, the most massive explosions in the Universe,\n" + 
    "and chemical reactions that form all element our bodies are made of\nare in development.", width/2, height/2 - 200);
    textSize(20);
    text("Click to go back to the diagram", width/2, 675);
  }
}

//__________________________________________________________________________________________________________

void mousePressed(){
  println(mouseX, mouseY);
  if(dataPage && mouseX < 100 && mouseY < 100){
    infoPage = true;
  }
  if(infoPage && mouseX > width - 100 && mouseY < 100){
    infoPage = false;
  }
  
  if(learnMode && mouseY > height * 0.4){
     dataPage = false;
     learnMode = false;
     lowMass = true;
  }
  if(learnMode && mouseY < height * 0.4){
     dataPage = false;
     learnMode = false;
     highMass = true;
  }
  if(highMass && mouseY > 650){
    highMass = false;
    dataPage = true;
  }
  if(lowMass && lm_counter == 9){
  fill(255);
  blackHolePage[2] = blackHolePage[3] = " ";
     if(mouseX > width/2 - 150 && mouseX < width/2 - 50){
        blackHolePage[0] = "Incorrect!";
     }
     if(mouseX > width/2 + 50 && mouseX < width/2 + 150){
       blackHolePage[0] = "Correct!";
     }
   blackHolePage[1] = "A star has to weigh at least three solar masses\n" + 
   "to explode into a Supernova\nand eventually become a Black hole";
  }
}

void keyPressed(){
  if(keyCode == RIGHT){
    if(lowMass){
      lm_counter++;
    }
  }
  if(keyCode == LEFT){
    if(lowMass){
      lm_counter--;
    }
  }
  if(lm_counter == 11){
    restartVariables();
  }
  if(keyCode == 32){
    noLoop();
  }
}

void keyReleased(){
  if(keyCode == 32){
    loop();
  }
}
