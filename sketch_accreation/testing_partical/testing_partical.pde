ArrayList <particalSystem> ps;
PVector location ; 


  void setup(){
    size(800,800);
    location = new PVector(width/2,height/2);
    ps = new ArrayList();
  
      
  }
  
  void draw (){
   background(255);
   location = new PVector(mouseX,mouseY);
   
   for( particalSystem pss : ps ){
     pss.make();
     pss.display();
   
   }   
 
  }
  void mousePressed(){
    ps.add(new particalSystem(location));
  
  
  }