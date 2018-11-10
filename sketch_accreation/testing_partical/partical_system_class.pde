class particalSystem {
  
  PVector location = new PVector(width/2,height/2);
  ArrayList <partical>  ps = new ArrayList() ;
 

  particalSystem( PVector loc ){
     location = loc; 
    
    
  }
  
   


void make(){
  
      ps.add(new partical(location));
    
}
void display(){

   for(int i = ps.size()-1 ;i>=0;i--){
     partical p = ps.get(i);
     p.update();
     p.display();
     if (p.is_dead()== true){
         ps.remove(i);
     
     } 
   }
  // print("size =" + ps.size());
 }





}