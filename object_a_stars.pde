class Star{
float x_pos, y_pos, radius;
float y_pos0;

  // Constructor and constructor-related functions
  Star(float _x_pos, float _y_pos, int i){
    x_pos = _x_pos;
    y_pos = _y_pos;
    y_pos0 = -60;
    radius = radius(i);
  }
  
  float radius(int i){
    if(x_pos < 330){
        radius = radii_s[i];
      }
      if(x_pos >= 330 && x_pos < 700){
        radius = radii_s[5];
      }
      if(x_pos >= 700){
        if(floor(x_pos/100 - 1) < radii_s.length){
          radius = radii_s[floor(x_pos/100 - 1)];
        }else{
          radius = radii_s[radii_s.length - 1];
        }
      }
     return radius;
  }
  
//________________________________________________________________________________
  
  // Draw funtions
  void design(){
    noStroke();
    if(mouseX > x_pos - radius/2 && mouseX < x_pos + radius/2 && mouseY > y_pos - radius/2 && mouseY < y_pos + radius/2){
      fill(star_color[floor(x_pos/(width/star_color.length))], 100);
    }else{
      fill(star_color[floor(x_pos/(width/star_color.length))]);
    }
    
  }
  
  void move_into_place(){
    noStroke();
    ellipse(x_pos, y_pos0, radius, radius);
    
    if(y_pos0 < y_pos){
      y_pos0 += speed;
    }
  }
  
  void position_no_movement(){
    ellipse(x_pos, y_pos, radius, radius);
  }
  
  // function to figure out the number of an object for interactivity
  void detect_position(int i){
    if(mousePressed && mouseX > x_pos - radius/2 && mouseX < x_pos + radius/2 && mouseY > y_pos - radius/2 && mouseY < y_pos + radius/2){
      println(i);
    }
    if((mouseX > x_pos - radius/2 && mouseX < x_pos + radius/2 && mouseY > y_pos - radius/2 && mouseY < y_pos + radius/2)
   && (i == 3 || i == 8 || i == 9 || i == 11 || i == 13 || i == 14 || i == 25 || i == 27)){
       shapeMode(CORNER);
       shape(triangle, x_pos + radius/1.98, y_pos - radius*2.2, radius*2, radius*2);
       
       pushMatrix();
       translate(x_pos + radius * 1.5, y_pos - radius);
       fill(255);
       rotate(-PI/5);
       if(i == 3){
         text("Achernar", 0, 0);
       }
       if(i == 8){
         text("Vega", 0, 0);
       }
       if(i == 9){
         text("Sirius A", 0, 0);
       }
       if(i == 11){
         text("Altair", 0, 0);
       }
       if(i == 13){
         text("Alpha\nCentauri", 0, 0);
       }
       if(i == 14){
         text("Sun", 0, 0);
       }
       if(i == 25){
         text("Proxima\nCentauri", 0, 0);
       }
       if(i == 27){
         text("Barnard's\nStar", 0, 0);
       }
       
       popMatrix();
    }
  }
  
  void arrow(int i){
    if(i == 8){
       shapeMode(CORNER);
       shape(triangle, x_pos + radius/1.98, y_pos - radius*2.2, radius*2, radius*2);
    }
  }
 
  
}

  
