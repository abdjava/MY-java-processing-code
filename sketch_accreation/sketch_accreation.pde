
ball[] balls ;
PVector force;

void setup(){
size (800,800);
force = new PVector(0,0.5);
balls = new ball[1];
for (int i =0; i<balls.length; i++){
balls[i] = new ball();
}
  
//frameRate(10);
}

void draw(){

background(255);
for (ball b:balls){


b.applyforce(force);
b.applyforce(new PVector(0,0));
b.update();
b.display();
b.checkEdges();
}
}