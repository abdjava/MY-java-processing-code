class ball {
  
PVector mouse;
PVector pos ;
PVector vel;
PVector acc;
float r ;
float mass;

  ball(){
  
  pos = new PVector (width/2,height/2);
  vel = new PVector(0,0);
  acc = new PVector(0,0.1);
  r = 10;
  mouse = new PVector(mouseX,mouseY);
  mass =  1 ;
  
  }
  void display(){
  stroke(0);
  fill(100);
  ellipse(pos.x,pos.y,2*mass*r,2*mass*r);
 
  }
  void update(){
    
   vel.add(acc);
   pos.add(vel);
   acc.mult(0);
  }
  void applyforce(PVector force){  
    
    PVector f = PVector.div(force,mass);  
    acc.add(f);
  
  }
  void moveTowardsMouse(){
  //updateing accreation and velsoity
   mouse = new PVector(mouseX,mouseY);
   vel.add(acc);
   pos.add(vel);
   mouse.sub(pos);
   mouse.setMag(0.5);
   vel.limit(5);
   
   acc= mouse;//.mult((PVector.dist(mouse,pos)-0)*0.01);;
  
  
  
  }
  void checkEdges() {

    if (pos.x > width) {
      pos.x = width;
      vel.x *= -1;
    } else if (pos.x < 0) {
      vel.x *= -1;
      pos.x = 0;
    }

    if (pos.y > height) {
      vel.y *= -1;
      pos.y = height;
    }

  }
  void friction (){
  
  
  
  }

}