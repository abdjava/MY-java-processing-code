class pendulum{
  PVector location_top = new PVector(width/2,0) ;
  PVector location_ball = new PVector(width/2,height/2);
  float r = 36;
  float angle =0;
  float len = PVector.dist(location_top,location_ball);
  float vel;
  float k =0.01 ;
  
  
  pendulum(PVector location_line,PVector locationball,float max_angle){
  
      location_top = location_line;
      location_ball = locationball;
      angle = max_angle;
      
  }
  

     void draw_ob (){
          fill (100);
          stroke(100);
          
          
          
         location_ball.x = location_top.x +(len*sin(angle));
         location_ball.y = location_top.y + (len*cos(angle));
       //  print(len+"   ");
         angle +=vel;
         vel+= -sin(angle)*k;
         //vel*= 0.999;
         
         
         
          line(location_top.x,location_top.y,location_ball.x,location_ball.y);
          ellipse(location_ball.x,location_ball.y,r,r);
        
     
        
      }


    

}