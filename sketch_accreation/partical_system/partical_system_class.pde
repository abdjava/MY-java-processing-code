class partical_system_class {

  PVector location = new PVector(0,0);
  ArrayList <partical> ps ;
  int number;

  partical_system_class( int number_of_partical){
  
     ps = new ArrayList();
    number = number_of_partical;
  
  }
    partical_system_class( ){
  
     ps = new ArrayList();
    number = 2;
  
  }


void make(){

   for(int i = 1; i<number; i++){
      ps.add(new partical());
    }


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
 }





}