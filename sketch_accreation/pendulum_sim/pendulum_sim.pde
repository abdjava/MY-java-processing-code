
PVector line_pos ;
PVector ball_pos ;
pendulum p;


void setup(){
  size (600,600);
  line_pos = new PVector(width/2,0);
  ball_pos = new PVector (width/2,height/2);
   p = new pendulum(line_pos,ball_pos,PI/4);
  
 
  


}

void draw(){
  background(255);
  
  p.draw_ob();
  

  
}