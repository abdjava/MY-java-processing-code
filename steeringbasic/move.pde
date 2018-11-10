class move{

PVector loc;
PVector acc;
PVector vel;
PVector desire;
float maxspeed;
float maxforce;
float r = 6;

// consturctor 
move (float x ,float y ){

loc = new PVector(x,y);
vel = new PVector(1,0);
acc = new PVector(0,0.1);
maxspeed = 4;
maxforce=0.1;
}

move ( ){

loc = new PVector(0,0);
vel = new PVector(0,0);
acc = new PVector(0,0.1);
maxspeed = 4;
maxforce=0.1;
}

void update(){
vel.add(acc);
loc.add(vel);
acc.mult(0);
}
void display(){
  // drawing the triangle giveing color etc
  float angle =vel.heading();
  pushMatrix();
  fill(0);
translate(loc.x,loc.y);
  rotate(angle);
//rectMode(CENTER);
//rect(0,0,20,20);
   beginShape();
  vertex(0,-r);
  vertex(0,r);
  vertex(2*r,0);
  endShape(CLOSE);
popMatrix();

}
void seek(float x ,float y){
  
PVector target = new PVector(x,y);
// draw value of distance bewtten target and current
float distance = PVector.dist(target,loc);
// vector of distance bewteen  target and current location is dersierd change
desire = PVector.sub(target,loc);

// setting max speed and max force also uses arrive logic to slow down if close to target

if(distance>=100){
  desire.setMag(maxspeed);}
else{
  float m = map(desire.mag(),0,100,0,maxspeed);
  desire.setMag(m);
}


PVector steer = PVector.sub(desire,vel);
steer.limit(maxforce);
apply(steer);
}


void seek(felid feild){
  if(loc.x>width){
  loc.x=0;
  
  }
   if (loc.x<0){
  loc.x=width;
  }
   if(loc.y>height){
  loc.y=0;
  
  }
   if (loc.y<0){
  loc.y=height;
  }


desire = feild.wheretoflow(loc.x,loc.y);
desire.setMag(maxspeed);
PVector steer = PVector.sub(desire,vel);
steer.limit(maxforce);
apply(steer);

}


void apply(PVector force){
acc.add( force);

}


void seek(path p){
      //get a copy of the  velsoicty vector
    PVector predicted = vel.copy();
    // then we set its magsiude to 50 we do this cause we want to know its posion after it has moved 50 units
    predicted.setMag(50);
    //we add the current location to get the future location 
    predicted.add(loc);
    // gettting the path locations
    PVector start =p.start;
    PVector end = p.end;
    // getting the normal or closest proint
    PVector point = getNormalPoint(predicted ,start,end);
    //moveing a bit ahedad of normal point
    PVector dir = PVector.sub(end,start);
    dir.setMag(50);
    PVector target = PVector.add(point,dir);
    // calculateing distance bewteen target and preducted and checking vs radious of the path to see if we are on the path
    float distance = PVector.dist(target,predicted);
    
    if (distance>p.r){
    seek(target.x ,target.y);
    
    }
}
    
PVector getNormalPoint(PVector predicted,PVector start,PVector end){
      
    // getting the vector of the line the path we are to follow
    PVector line = PVector.sub(end,start);
    // getting unit vector
    line.normalize();
    // finding the postion vector of the mover based on the paths location from the start of path to its location 
    PVector pos = PVector.sub(predicted ,start);
    // find the point vector this is done by multplying the unit vector of the path with the distance or scaler projection found useing dot product
    PVector point = line.mult(pos.dot(line));
    // adding back start this is done cause we did all our caluclautetions abovse assumeing start is the orgain
    // so we add start to get the correct vector from the perstive of the top right rather than start
    point.add(start);
    
    return point; 
}

void boundaries(path p){

  if (loc.x > width){
      float dis = loc.y-p.end.y;
      loc = new PVector(0,p.start.y+dis);
  
  }


}



}
