class Giant extends Star{
float x_pos, y_pos, radius, y_pos0;
  
  Giant(float _x_pos, float _y_pos, int i){
    super(_x_pos, _y_pos, i);
  }
  
  float radius(int i){
    radius = radii_g[i];
    return radius;
  }
  
  void design(float _x_pos){
    super.design();
    if(lowMass){
      fill(star_color[floor(_x_pos/(width/star_color.length))], 100);
    }
  }

  
}
