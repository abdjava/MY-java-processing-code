class pop{

  ArrayList <mover> popluation;
  ArrayList <PVector> food,posion ;
  int min =1,dots =10;
  float rate =0;

pop(float mutation){

  rate = mutation;
popluation = new ArrayList();
food = new ArrayList();
posion = new ArrayList();

}

void start(int num_mover, int doats){
for (int i =0;i<doats;i++){

  food.add(new PVector(random(40,width-40),random(40,height-40)));
  posion.add(new PVector(random(40,width-40),random(40,height-40)));

}
for (int i =0;i<num_mover;i++){

  popluation.add(new mover(random(width),random(height)));
}
min = num_mover;

dots =doats;
}


 void display(){
  fill(0,255,0);
  for (int i =0;i<food.size();i++){
    
    ellipse(food.get(i).x,food.get(i).y,10,10);
  
  }
  fill(255,0,0);
  for (int i =0;i<posion.size();i++){
  
  ellipse(posion.get(i).x,posion.get(i).y,10,10);
  }

}

void update(){
// checking and running all movers   looping backwards to avoid missing or skpieing stuff
  for (int i =popluation.size()-1;i>-1;i--){
      if (popluation.get(i).dead){
        popluation.remove(i);
      }
      else {
      popluation.get(i).seek(food);
      popluation.get(i).anti_seek(posion);
      popluation.get(i).update();
    }
    
  }
  
  // replaces stuff if things are missing like food posion and mover
    while(popluation.size()<min){
    
      //popluation. add(new mover(width/2,height/2));
      
      make(); // makes useues evelution to make a new mover 
    }
    
    while(food.size()<dots){
    food.add(new PVector(random(40,width-40),random(40,height-40)));
    }
    while (posion.size()<dots){
    posion.add(new PVector(random(40,width-40),random(40,height-40)));
    }

    // need to add stuff to make it reproduces better not just add random shti




}


void make(){


mover m1 = select();
mover m2 = select();  // get to parents 

mover m3 = m1.cross(m2);// make the child mover 
m3.mutation(rate);// add random mutations 

popluation.add(m3);

}

mover select (){
// selection alogrthim 
float sumFitness =0;
int i =0;
for ( i=0;i<popluation.size();i++){
    sumFitness += popluation.get(i).health - 250;
    constrain(sumFitness,0,100000);
}


float r = random(sumFitness);
    
   i =0;
  while (r>0){
    r -= popluation.get(i).health -200;
    i++;
  }
i--;
return popluation.get(i);

}


}
