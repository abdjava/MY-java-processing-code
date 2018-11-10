class partical {

  float r = 20;
  PVector sartingLocation = new PVector(width/2,height/2);
  PVector location = new PVector(0,0);
  PVector vel;
  PVector acc =  new PVector(0,0.05);
  float life = 150;

  partical(PVector _location ){
  
    sartingLocation = _location; 
    vel = new PVector(random(-1,1),random(-1,1));
   
  }
  partical(){
    vel = new PVector(random(-1,1),random(-1,1));
   
  }
  
  
  void display (){
  pushMatrix();
// print(" x =" +  location.x +" y=  " +location.y);
  fill(random(0,100),life);
  translate(sartingLocation.x,sartingLocation.y);
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