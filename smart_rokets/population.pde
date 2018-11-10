class population{
  
ArrayList<mover> pop;
PVector target;
int maxpop , maxcycles;
int cycle=0;
float rate;


  population ( int _maxpop,float mutation_rate,int cycles , PVector _target ){
  pop = new ArrayList();
  maxpop=_maxpop;
  rate =mutation_rate;
  maxcycles =cycles;
  target = _target;
  }



void start(int n ){

for (int i =0 ;i<n;i++){
  pop.add(new mover(maxcycles));
  
}
}

void update(){

for (int i =0 ;i<pop.size();i++){
  pop.get(i).update();
  pop.get(i).display();

}
cycle++;
//print(pop.size()+"  ");

  // if the reach the max number cycles we restart
  if (maxcycles <cycle ){
    cross();
  }


}

void display(){
  fill(100,240,23);
  rectMode(CENTER);
 rect(target.x,target.y,16,16);

}

// this part of the code is a function to impelment the picking random mates 00 cycles
mover pick(){
    float sumfit=0;
    
    for (int i =0;i<pop.size();i++){
      // caluclate the sum of all fitneess
    sumfit += pop.get(i).fitness(target);
    
    }
    // picking random element algrothim 
   int index =0;
    float r = random(sumfit);
    for( ;r>0;index++){
    r -= pop.get(index).fitness(target);
    
    }
  index--;
  
  return pop.get(index);
  

}

void cross(){
  ArrayList<mover> newpop  = new ArrayList();
    for (int i =0;i<maxpop;i++){
  mover mate1 =  pick();
  mover mate2 =  pick();
  
    newpop.add(mate1.mate(mate2,rate));
  
  
  
    }

pop = newpop;
cycle =0;
}


}
