void controlText(int y_pos){
  textFont(avenirHeavy);
  fill(255);
  textSize(20);
  text("Use keyboard arrows to go between phases", width/2, y_pos);
}

void restartVariables(){
  lm_counter = 0;
    lowMass = false;
    dataPage = true;
    counter = 0;
    sun_text[0] = "Sun";
    sun_text[1] = "Gravity";
    sun_text[2] = "Pressure";
    sun_diameter = 600;
    sun_explosion = 20;
    shrink = true;
    neb_img_w = 50;
    neb_img_h = 50;
    rotation = 0;
    neb_shape_w = 300;
    neb_shape_h = 421;
    blackHolePage[0] = "Do you think our sun will become a Black Hole?";
    blackHolePage[1] = " ";
    blackHolePage[2] = "Yes";
    blackHolePage[3] = "No";
    x1 = -150;
    x2 = 1350;
    sn_expl = 200;
    for(int i = 0; i < ns; i++){
      stars[i].design();
      stars[i].position_no_movement();
      if(i == 14){
        stars[i].x_pos = x_axis_f[i];
        stars[i].y_pos = y_axis_f[i];
        stars[i].radius = stars[i].radius(i);
      }
    }
    for(int i = 0; i < arrows.length; i++){
      arrows[i].x_pos1 = i * 35;
      arrows[i].x_pos2 = width + 300 - i * 35;
    }
}
