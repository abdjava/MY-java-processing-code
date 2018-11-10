
popluation pop;
String tar ="TO be or not to be that is the question";
char target[] = tar.toCharArray();

void setup(){
  size(800,600);

pop = new popluation(target ,1000,0.05);

pop.start(300);
}


void draw(){
  background(255);
  pop.nextgen();
  pop.display();
 
 print(pop.avgfit +"   ");
  
}
