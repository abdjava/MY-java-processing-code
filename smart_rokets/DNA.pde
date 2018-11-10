class DNA{

PVector dna[] ; 

DNA (int cycles){
  
dna = new PVector[cycles];
}

DNA (PVector outsideDna[]){


dna = new PVector[outsideDna.length];
dna = outsideDna;
}


void start(){
// makeing a ramdom dna 
for(int i =0 ;i<dna.length;i++){

  dna[i] = PVector.random2D();
}


}



void mutation(float rate){
  
  for (int i =0;i<dna.length;i++){
   float r = random(0,1);
   if (rate>r){
     dna[i] = PVector.random2D();
     }
   
   
  }
}

DNA mate(DNA other){
  
  PVector[] next_gen = new PVector[dna.length];
for (int i = 0;i<dna.length;i++){
  next_gen[i] = PVector.add(dna[i],other.dna[i]);
  // normalized them so they are still a unit of 1
  next_gen[i].normalize();
  
}
  

return new DNA(next_gen);
}


}
