ArrayList <move> boxes;
felid f;
path p;
move m;

void setup(){
  boxes = new ArrayList();
  
  size(800,600);
  f = new felid();
  f.beginNoise();
  p =new path();
  m = new move();

}


void draw(){
background(255);
  p.display();

for(move box :boxes){
box.seek(p);
box.boundaries(p);
box.update();
box.display();

}

//print(" fps = " + frameRate );

//f.display();
}

void mousePressed(){
boxes.add(new move(mouseX,mouseY));





}
