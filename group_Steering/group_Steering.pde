ArrayList<mover> ms;


void setup(){
size (640,360);
ms = new ArrayList();

for (int i = 0;i<100;i++){

ms.add(new mover(random(width),random(height)));

}

}



void draw (){
background(255);

for (mover m:ms ){

//m.serapate(ms);
//m.seek(mouseX,mouseY);
m.applyMouse(ms);
m.update();
m.display();

}



}

  
void mousePressed(){
for (int i = 0 ;i<20;i++){
ms.add(new mover(mouseX+random(-1,1),mouseY+random(-1,1)));
}
}
