class partical {

  float r = 20;
  PVector location = new PVector(0,0);
  PVector vel;
  PVector acc;
  float life = 150;

  partical(PVector _location ){
  
    location = _location;
    vel = new PVector(random(-1,1),random(-1,1));
    acc =  new PVector(0,0.05);
  }
  partical(){
  
    location = new PVector(0,0);
    vel = new PVector(random(-1,1),random(-1,1));
    acc =  new PVector(0,0.05);
  }
  
  
  void display (){
     pushMatrix();
     fill(random(0,100),life);
  translate(width/2,0);
  stroke(0,life);
  strokeWeight(2);
  ellipse(location.x,location.y,r,r  );
  popMatrix();
  
  
  }
  void update(){
  vel.add(acc);
  location.add(vel);
  
  life--;
  
  }
  boolean is_dead (){
    if (life <= 0){
       
      return true; 
       }
       else{
       return false;
       }
  
  }

}