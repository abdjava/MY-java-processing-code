class mover {

PVector acc,vel,pos ;
float r = 6;
int cycle=0;
float fitness=0;
boolean crash = false , crash_target=false;
DNA dna ;



 // only the top consturcter us used
 mover(DNA _dna){
 
 dna =_dna;
 acc = new PVector(0,0);
vel = new PVector(0,0);
pos = new PVector(width/2,height-50);
 }
 
 
 
mover (int cycles){
  // createing the dna
dna = new DNA(cycles +10);
dna.start();
  
acc = new PVector(0,0);
vel = new PVector(0,0);
pos = new PVector(width/2,height-50);

}
mover(PVector start){
// createing the dna
dna = new DNA(200);
dna.start();
acc = new PVector(0,0);
vel = new PVector(0,0);
pos = start;
}


mover(float x ,float y){
// createing the dna
dna = new DNA(200);
dna.start();
  
acc = new PVector(0,0);
vel = new PVector(0,0);
pos = new PVector(x,y);
}



void update(){
  if (!crash){
applyforce(dna.dna[cycle]);  //pulling the force out of the dna
vel.add(acc);
pos.add(vel);
acc.mult(0);

}

cycle++;
}

void display(){
  
  // drawing the shape roket
  pushMatrix();
  fill (100);
  
   translate(pos.x,pos.y);
   rotate(vel.heading()-PI/2);
  
 
  beginShape(TRIANGLES);
  vertex(-r,0);
  vertex(+r,0);
  vertex(0,4*r);
  endShape();
 
  popMatrix();
}


void applyforce(PVector force){

acc.add(force);

}
// mate
mover mate(mover m,float rate){

DNA d =  dna.mate(m.dna);
  d.mutation(rate);
return new mover(d);
}

float fitness(PVector target){

float dis =PVector.dist(pos,target);
if(crash &&!crash_target){
fitness = 0 + 0.00000000000000000001;  // the small amount added is to avoid haveing all the fitness of all the movers be zero this results is 
}                                      // the picking function in the population not working as a rquires a sum of all fitness to be >0
else{ fitness = pow(1/dis ,1/4);  }
//print(fitness +" ");
return fitness;
}




}
