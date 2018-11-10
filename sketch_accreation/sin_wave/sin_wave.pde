int x =100;
float vel =0;
mover [] m = new mover[x];
float location = -400;
float phase = 0;

void setup(){
   size(800,800);
   
   // for loop used to insilazie all movers slightly next to each other with slight different phse to show a sin wave 
  for(int i = 0 ; i< m.length; i++){
    phase = -TWO_PI/width *location;
    
    m[i] = new mover(location,phase,0.01); 
  
  
  
  // stops from 0 being added to location each time
  if (width/(x-1)>1){
        location += width/(x-1) ;
        }
   else {
         location++; 
                            }
    }
}

void draw (){
  print (frameRate +"       ");
  background(255);
  fill (100);
  stroke(50);

 
 
  for(int i = 0 ; i< m.length; i++){
    m[i].display();
    m[i].move_sin();
  
  
  }
  
  
  

}