class dna {

char pharse[] ;


  dna (int n ){
  pharse = new char[n];
  
  
  }
  dna (int n ,char _pharse[]){
    pharse = new char[n];
    pharse = _pharse;
    
  }
  
  

  void makeRandom(){
  
  for(int i = 0 ;i <pharse.length;i++){
  pharse[i] = (char)((int)random(32,123));
  
  }
  
  
  }
  
  void mutation(float rate){
  
  float num = random (0,1);
    if (num < rate){
      // get a random poistion in the pharse and change it 
    int i = (int )random(0,pharse.length);
    pharse[i] = (char)(int(random (32,123)) ) ;
    }
  
  }
  
  
  char[] mate (dna mate){
  
  char child[] = new char[pharse.length] ;
  for (int i =0;i<pharse.length;i++){
    float r = random(0,2);
      if (r>1){
      child[i] = pharse[i];
      
      }
      else {
      child[i]= mate.pharse[i];
      }
  }
  return child;   
}
  
  
  

 float calfit (char target[]){
 
 float fitness =0;
 
   for (int i = 0; i <pharse.length; i++ ){
   if (target[i]== pharse[i]){
   fitness++;
   
   }
   
   }
   fitness/= pharse.length;
 
 return fitness;
 }


}
