class popluation {
// all the varibles
int gen =0;
ArrayList <dna> ind;
char target[];
int maxpop;
float rate;
float avgfit=0;
dna bestdna ;
// constuctor 

popluation( char _target[] ,int maxpoplution,float mutation_rate){
maxpop = maxpoplution;

rate = mutation_rate;
target =_target;


ind = new ArrayList();
bestdna = new dna(target.length);
}


// funcation to start
void start(int n ){
// makes n random dna elements to start the alograithim
  for (int i =0;i<n ;i++){
      ind.add(new dna(target.length));  
      ind.get(i).makeRandom();

  }
}
// funcation to move on to next genration
void nextgen(){
  // arraylist pool which is the mateing poool which is the fitness weighted indviusal pool
  //nextgen is the next gen calulcation
  ArrayList <dna> pool = new ArrayList();
  ArrayList <dna> nextgen = new ArrayList();
  float bestfit=0;
  float fit =0;
  float sumfit=0;
for (int i =0 ;i<ind.size();i++){
  // calulcates fitness as a percentage and avarage fitness as a float
  
  fit = (100*ind.get(i).calfit(target));
  sumfit +=fit/100;
  
  // this parts calulcates the most fit cutures
       if (bestfit <fit){
            bestfit = fit;
            bestdna = new dna (target.length,ind.get(i).pharse);
        }
  
  
  for(int j =0;j<fit;j++){
     // add the element for depending on its fitness
    pool.add(ind.get(i));
  }
}
avgfit = sumfit/ind.size();
// at this point you got a pool with the all the dna 
  // goging to take 2 ramdom parents  then make a arraly list which is the next gen 

  for (int i =0;i<maxpop;i++){
  int p1 = (int)random(0,pool.size());
  int p2 = (int)random(0,pool.size());
  
  nextgen.add(new dna(target.length,pool.get(p1).mate(pool.get(p2))));
  }
  for (int i =0 ;i<maxpop;i++){
    // interduce ramdom mutations
  nextgen.get(i).mutation(rate);
  }
  

  ind = nextgen;

gen++;



}


void display(){

  fill(0, 102, 153);
  textSize(16);
  
  text("Mutation rate " +rate ,width/8,100);
  text("Avgarge Fitneess "+ avgfit*100 +"%",width/8,150 );
  text ("Genrations = "+gen,width/8,125);
  text(" the best dna is  = ",width/8,200);
  text(bestdna.pharse,0,bestdna.pharse.length,width/8,225);
  text("all pharse \n" +type(),width*2/4,20);
  

  }
  
String type(){

  String everything = "";
  int displayLimit = min(ind.size(),50);
  
  for (int i = 0; i < displayLimit; i++) {
  everything +=str(ind.get(i).pharse) +"\n";
  }


 return everything; 
}




}
