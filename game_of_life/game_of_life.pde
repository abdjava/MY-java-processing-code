gameoflife life;

void setup(){
size(800,600);
life = new gameoflife();
life.startrand();
}


void draw(){
  frameRate(15);
//print(frameRate+ " ");
background(255);
life.nextgen();
life.display();
 
  
//noLoop();
}
