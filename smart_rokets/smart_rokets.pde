

/*

maybe the function check should be in the mover as that would make a lot more sense 
also you should be able to add where you can draw boxes from use of the mouse 





*/
box b;
population p ;
void setup(){
size (800,600);

b= new box(width/3,height/4,400,20);
p = new population(500,0.005,200, new PVector(width/2,50));
p.start(500);
}


void draw(){
background(255);
b.display();  // displays the box
b.check(p.pop,new PVector(width/2,50)); // is a function in the box object to check if the movers crash
p.update();// updates all the movers and displays them 
p.display();// displays the target


//print ("  "+frameRate);
}
