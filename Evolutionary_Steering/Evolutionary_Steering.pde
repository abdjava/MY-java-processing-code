// stuff i need to fix 
// make 1 function for both seek and anti seek ;
// 



mover m ;
pop p ;

void setup(){

size(1024,800);
m = new mover(width/2,height/2);
p = new pop(0.01);
p.start(10,25);
}

void draw(){
background(255);

p.display();
p.update();
//m.seek(new PVector(mouseX,mouseY));
//m.update();
}
