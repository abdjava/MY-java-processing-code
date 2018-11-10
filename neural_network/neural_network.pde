network nn ;

float[] input1 = {1,1};
float[] ans1 = {0};

float[] input2 = {1,0}; 
float[] ans2 = {1};

float[] input3 = {0,1};
float[] ans3 = {1};

float[] input4 ={0,0};
float[] ans4 ={0};


void setup(){
  size(800,600);
  nn = new network(2,2,1);
 // print( "  this is output  = "+ nn.feedforward(input).matrix[0][0]);
}


void draw(){
background(255);

for (int i =0;i<50000;i++){
  float r = random(4);
  
  if (r>3){  nn.train(input1,ans1); }
  else if (r>2){    nn.train(input2,ans2);}
  else if (r>1){   nn.train(input3,ans3);}
  else {    nn.train(input4,ans4);}

}


print( "input 1 =   "+ nn.feedforward(input1).matrix[0][0] + "  ");
print(" input 2 =" +nn.feedforward(input2).matrix[0][0]+ "  ");
print(" input 3 ="+nn.feedforward(input3).matrix[0][0]+ "  ");
print(" input 4 = "+nn.feedforward(input4).matrix[0][0]+" \n " );





noLoop();

fill(0, 102, 153, 51);
textSize(32);
text( frameRate ,width/2,height/2);

}


void mousePressed(){



}
