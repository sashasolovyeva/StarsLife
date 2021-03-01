class Arrow{
  float x_pos1, x_pos2, y_pos1, y_pos2, speed;
  Boolean outofrange = false;
  
  Arrow(int i){
    x_pos1 = i * 35;
    x_pos2 = width + 300 - i * 35;
    y_pos1 = height/2 + 20;
    y_pos2 = height/2 - 20;
    speed = 1.7;
  }
  
  void move(){
    shape(triangleRight, x_pos1, y_pos1, 40, 40);
    shape(triangleLeft, x_pos2, y_pos2, 40, 40);
    
    if(x_pos1 < width/2 + 330){
      x_pos1 += speed;
    }
    if(x_pos2 > width/2 - 40){
      x_pos2 -= speed;
    }
    if(x_pos2 <= width/2){
      x_pos2 = -50;
    }
  }
  
}
