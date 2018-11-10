class CA {

  
  int cell[] ; 
  int histroy[][];
  int rules[] ;
  int gen = 0;
  int rows ;
  int colloms;
  int w = 4;


  CA( int ruleset[]){
  
  rows = height/w;
  colloms = width/w;
  cell = new int[colloms];
  histroy = new int[rows][colloms]; 
  rules = ruleset;
  
  
  restart();
  }
  
  
int[] convert (int num){
int b = num;
 int a[] = new int[8] ;
    a[7] =(int)b/2^7;
 for (int n =6 ; n>-1;n--){
   b += -a[n+1]*2^(n+1); 
  a[n] =(int)(b)/2^n  ;
  
 }
return a;
}  
  
    
void  restart(){
  //resarts the code
  
  // setting all elements to zero
  // setting the middel one to 1 
  
  
  for (int i = 0 ;i<rows;i++){
    for (int j = 0 ; j<colloms;j++){
    histroy[i][j] = 0;
    
    }
  }
  
  histroy[0][colloms/2] = 1 ;
  }
  
  
  
  
 int rule (int a , int b , int c){
 // this is the funcation that returns a rule for the petular state of the system
 // a is the number to the left b is the middel c is one to the right
 
 // complamenting all the bits this is done cause the rules in wolfrum is done with 8 corspoind
 // to 0  (111 is frist element of the array  ) so we complement the input to get the right index stuch that 111 become 0 so rules[0]
     if (a ==1){
       a = 0;
     }
     else {
       a =1;
     }
     
      if (b ==1){
       b = 0;
     }
     else {
       b =1;
     }
      if (c ==1){
       c = 0;
     }
     else {
       c =1;
     }
 
 int index = a*4 +b*2 +c;
 return rules[index];
 
 }

void display(){
  fill(0);
  for (int i = 0 ;i < rows;i++){
    for (int j =0 ; j<colloms ;j++){
      if (histroy[i][j] ==1){
        noStroke();
         rect(j*w,height -(i)*w ,w,w);
      }
    }
  }
  }


void Next_gen(){

int new_gen[] = new int[colloms] ;

for (int i =1 ;i<colloms-1 ;i++){
int a = histroy[gen%(rows)][i-1];
int b = histroy[gen%(rows)][i];
int c = histroy[gen%(rows)][i+1];
  
  new_gen[i] = rule(a,b,c);
}
gen++;
histroy[gen%(rows)] =new_gen ;

}







}
