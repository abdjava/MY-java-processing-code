
/*
Things to do in this sim 
its the sim of Wolfram Elementary Cellular Automata look at 
http://mathworld.wolfram.com/ElementaryCellularAutomaton.html

things i need to fix get it schrool up from the bottom instead of drawing from the 
top to bottom

also write a funcation to convert number into the array format of int the arry is 
basicly what i used for a binary number 
*/







CA wolf;
int ruleset[] = {0,0,1,1,0,1,1,0};

void setup(){
size(800,600);

wolf = new CA (ruleset);
}




void draw(){
background(255);
print(" "+frameRate);
 wolf.display();

    
//printArray(wolf.convert(30));
    
 wolf.Next_gen();

//noLoop();
}
