class walk{
float x ;
float y ;

  walk(int pos_x,int pos_y){
  x = pos_x;
  y = pos_y;
  }
  
  void render (){
  
  stroke(0);  
  point(x,y);
  
  }
  
  void move_random(int move)
  
  {
  int rng = int(random(4) );
  if (rng == 0){
  x= x+move;
  
  }
  else if (rng ==1){
  y= y+move ;
  
  }
  else if(rng ==2){
  x= x-move;
  
  }
  else{
  y = y- move;
  }
  constrain(x,0,500);
  constrain(y,0,500);
  
  }
  
  void move_real(int move ){
  float theta = random(4)* 90;
  x = x + move *cos (theta);
  y = y + move *sin (theta);
    
  constrain(x,0,500);
  constrain(y,0,500);
  }
  
}