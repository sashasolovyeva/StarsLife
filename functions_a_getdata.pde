void getArrayData(){
  String[] x_axis_s = loadStrings("x_pos.txt");
  String[] y_axis_s = loadStrings("y_pos.txt");
  
  x_axis_f = new float[x_axis_s.length];
  y_axis_f = new float[y_axis_s.length];
  
  for(int i = 0; i < x_axis_s.length; i++){
    x_axis_f[i] = float(x_axis_s[i]);
    y_axis_f[i] = float(y_axis_s[i]);
  }
}

void getAPIData(){
  JSONObject APIobject = loadJSONObject(link + search_queries[0]);
  pn_descr = APIobject.getString("definition");
  JSONObject APIobject2 = loadJSONObject(link + search_queries[1]);
  pn_descr2 = APIobject2.getString("definition");
}
