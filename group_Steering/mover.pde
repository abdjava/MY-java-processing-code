class mover{
PVector loc;
PVector acc;
PVector vel;
PVector desire = new PVector(0,0);
float maxspeed;
float maxforce;
int r = 5;
mover(float x ,float y){

loc = new PVector(x,y);
vel = new PVector(0,0);
//vel = new PVector(random(-5,5),random(-5,5));
acc = new PVector(0,0);
maxspeed = 5;
maxforce=0.1;


}

void update(){
  
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
  
acc.limit(maxforce);  
vel.add(acc);
vel.limit(maxspeed);
loc.add(vel);
acc.mult(0);
}


void apply(PVector force){
acc.add( force);

}

void display(){

fill(100);
ellipse(loc.x,loc.y,2*r,2*r);
}



// different algurithims 
// this one seeks the mouse but also uses serpareation
void applyMouse (ArrayList <mover> other){
PVector seekForce = seek(mouseX,mouseY);
PVector serapateForce = serapate(other);

seekForce.mult(1);
serapateForce.mult(4);
apply(seekForce);
apply(serapateForce);

}
// aligns its vel with all the other moves in 100 units 
void align(ArrayList<mover> others){
PVector vel_sum = new PVector(0,0);
int i =0;
for(;i<others.size();i++){
  float dis = PVector.dist(loc,others.get(i).loc);
  
  
if(dis<100&&dis>0 ){
   PVector vel_other = others.get(i).vel;       // the velsoicty of the other mover 
  
    vel_sum.add(vel_other);
  }
  }
  if(i>0){
      vel_sum.setMag(maxspeed);
      desire =  PVector.sub(vel_sum,vel);
      desire.limit(maxforce);
      apply(desire);
      }
}

PVector seek(float x ,float y){
  
PVector target = new PVector(x,y);
// draw value of distance bewtten target and current
float distance = PVector.dist(target,loc);
// vector of distance bewteen  target and current location is dersierd change
PVector desire = PVector.sub(target,loc);

// setting max speed and max force also uses arrive logic to slow down if close to target

if(distance>=100){
  desire.setMag(maxspeed);}
else{
  float m = map(desire.mag(),0,100,0,maxspeed);
  desire.setMag(m);
}


PVector steer = PVector.sub(desire,vel);
steer.limit(maxforce);
//apply(steer);
return steer;
}





PVector serapate(ArrayList<mover> others){
float desire_dis = r*3;
PVector sum = new PVector(0,0);
int i =0;

for (mover other:others){
  float d = PVector.dist(loc,other.loc);
  if(d <desire_dis && d>0){
  PVector dis = PVector.sub(loc.copy(),other.loc);
 // dis.normalize();
  dis.div(d*d);
  sum.add(dis);
  
  i++;
  }
}

if(i>0)  {
sum.setMag(maxspeed);
  // impelting renold steering behaviour
PVector desire =  PVector.sub(sum,vel);
desire.limit(maxforce);
//apply(desire);

return desire;
}
return new PVector(0,0);
}




}
