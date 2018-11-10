class mover{
PVector location = new PVector(00,400);
float a_vel = 0;
float phase =0;

  mover(float x, float angle,float angle_vel){
  location.x=x;
  //location.y=y;
  phase = angle;
  a_vel =angle_vel;
  
  }
  
  
  void move_sin(){
    
  phase += a_vel;
  location.y= width/2*(-sin(phase));
  
  
  }
  void display(){
  pushMatrix();
  translate(width/2,height/2);
  ellipse(location.x,location.y,32,32);
  popMatrix();
  
  }


}