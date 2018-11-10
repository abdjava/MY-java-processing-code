class mover{

PVector pos,vel,acc ;
float maxforce=0.2,maxspeed=6,health =500;
int r = 10 , age =0;
float w1 , w2 ,sight_posion ,sight_food;// this is the dna section
boolean dead = false;



 mover(float x ,float y){
 
 pos = new PVector(x,y);
 vel = new PVector(0,0);
 acc = new PVector(0,0);  

w1= random(-5,5);
w2 = random(-5,5);
sight_posion = random(0,150);
sight_food = random(0,150);
 }
 
 
 
 mover (float x ,float y,float _w1,float _w2 ,float _sight_posion ,float _sight_food){
  pos = new PVector(x,y);
 vel = new PVector(0,0);
 acc = new PVector(0,0);  
 w1 =_w1;
 w2=_w2;
 sight_posion =_sight_posion;
 sight_food =_sight_food;
 }


void update(){
  age++;
  // checking if dead 
  if (health <=0 ){
  
  dead = true;
  }
  
  if (!dead){
        // physcies engine
        vel.add(acc);
        if (vel.mag()==0){vel.add(PVector.random2D().mult(maxspeed));  }
        vel.limit(maxspeed);
        pos.add(vel);
        acc.setMag(0);
          // display and health
        display();
        health --;
        //print(health +"   ");
  }
        
// checking for border condition kill them if they leave 
//        
if (pos.x<0){dead = true;}
else if (pos.x>width){dead = true;}
else if (pos.y>height){dead = true;}
else if (pos.y<0){dead = true;}
        
        
      
  
}

void seek (PVector input){
seek(input.x,input.y);
}


// main seek funcation that does used in the other seeks
void seek(float x ,float y ){
  PVector target = new PVector(x,y);
  
  // only apply streer if it can see the thing
  if (PVector.dist(target,pos)<sight_food){
  PVector forward = new PVector();
  forward = PVector.sub(target,pos);
  
  PVector steer = new PVector();
  steer =  PVector.sub(forward.setMag(maxspeed),vel);
  steer.mult(w1);
  force(steer.setMag(maxforce));

}


}
void force(PVector input ){
acc.add(input);
}


void display(){
  
  pushMatrix();
  beginShape();
  stroke(117,117,20);
  
  translate(pos.x,pos.y);
  if (health >500){        // changes color based on helth
  fill(10,200,10);}
  else if (health>200 &&health<500){fill (117,117,20);}
  else {fill(200,20,20);}
  rotate(vel.heading()+PI/2);
  vertex(0.75*r,0);
  vertex(-0.75*r,0);
  vertex(0,-2*r);

  endShape(CLOSE);
  stroke(205,0,0);
  noFill();
  ellipse(0,0,2*sight_posion,2*sight_posion);
  
  stroke(0,200,0);
  ellipse(0,0,2*sight_food,2*sight_food);
  
  popMatrix();
}
// this version of seek finds the closest thing and seeks it 
// it also removes the object from the list if it is too close
void seek(ArrayList<PVector>  list ){
float record = 9999999;
int i_best =0;
  for (int  i=0;i<list.size();i++){
      if(list.get(i).dist(pos)<record){
      record = list.get(i).dist(pos);
      i_best = i;
      }
  
  }
    if(record>10 && list.size()>0){
    seek(list.get(i_best));}
    else if(record <=10 ){
    list.remove(i_best);
    health += 200;
    
    }
}


void anti_seek(ArrayList<PVector> list){
  float record = 9999999;
int i_best =0;
  for (int  i=0;i<list.size();i++){
      if(list.get(i).dist(pos)<record){
      record = list.get(i).dist(pos);
      i_best = i;
      }
  
  }
    if(record>10 && list.size()>0){
    anti_seek(list.get(i_best));}
    else if(record <=10 ){
    list.remove(i_best);
    health -= 200;
    
    }


}
// main anit seek funcation made for posion need to fix cause it just the seem but useing w2 instead of w1
void anti_seek(PVector posion){
  PVector target = new PVector(posion.x,posion.y);
  
  // only apply if you can see it 
  if (PVector.dist(target,pos)<sight_posion){
  PVector forward = new PVector();
  forward = PVector.sub(target,pos);
  
  PVector steer = new PVector();
  steer =  PVector.sub(forward.setMag(maxspeed),vel);
  
  steer.mult(w2);
  force(steer.setMag(maxforce));}

  
  
}



// evelutions algrothim


mover cross(mover Mate){

  float new_w1  = (w1 +Mate.w1)/2;
  float new_w2  = (w2 +Mate.w2)/2;
  float new_sight_posion = (sight_posion+Mate.sight_posion)/2;
  float new_sight_food = (sight_food+Mate.sight_food)/2;

  return new mover(width/2,height/2 ,new_w1,new_w2,new_sight_posion,new_sight_food);
}



void mutation(float rate){
// this part of the code 
  if (random(0,1)>rate){
    float r = random(1);
    
      if(r  >2/3){
      w1 = random(-5,5);
      }
      else if (r<2/3 &&r>1/3){
      w2 = random(-5,5);
      }
      else {
      sight_posion = random(0,150);
      sight_food = random(0,150);
      }
    
    
  }

}



}
