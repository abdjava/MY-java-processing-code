class path {

float r = 30;
PVector start;
PVector end ;

path(int _r , PVector _start,PVector _end){

r = _r;
start =_start;
end=_end;
}
path(){
start = new PVector(0,height/2);
end = new PVector (width,2*height/3);

}

void display(){

stroke(0);
strokeWeight(0);

// this part makes the radious


fill(100,100);
  beginShape();
vertex(start.x,start.y+r);
vertex(end.x,end.y+r);
vertex(end.x,end.y-r);
vertex(start.x,start.y-r);

  endShape(CLOSE);
  
  // this part makes the line in the middel 
strokeWeight(3);
fill(255);
line(start.x,start.y,end.x,end.y);

}


}
