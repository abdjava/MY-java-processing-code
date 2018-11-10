class box{

PVector centre ;
int w ,h;


box (int x ,int y ,int _w,int _h){
centre = new PVector (x,y);
w=_w;
h=_h;

}






void display (){
// makes a react from  
fill(25,21,200,21);
rectMode(CENTER);
rect (centre.x,centre.y,w,h);

}

void check(ArrayList<mover> movers, PVector target){

for (int i =0; i<movers.size();i++){
PVector pos = movers.get(i).pos.copy();
  
  if (pos.x> width || pos.x<0||pos.y<0 ||pos.y>height){
  
  //movers.get(i).crash_target =true;
  movers.get(i).crash = true;}
                                                              // if go out of the screen you crash
  if (pos.x >centre.x-w/2&& pos.x<centre.x+w/2 && pos.y>centre.y-h/2 && pos.y<centre.y+h/2){
  
  movers.get(i).crash = true;
  } // checks the if the mover is in the box
  if (pos.x >target.x-8 && pos.x<target.x+8  && pos.y>target.y-8 && pos.y<target.y+8){
  
  movers.get(i).crash_target =true;
  movers.get(i).crash =true;}
  
  
  
  
  
  
}

}


}
