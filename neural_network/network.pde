class network{
// add biases later
  int num = 0;
matrix w1 ;
matrix w2;
matrix inputs ;
matrix h1;
matrix b1,b2;
float rate =0.1;

matrix output;

network(int num_inputs , int num_hidden, int num_output){
  
  b1 = new matrix(num_hidden,1);
  b2 = new matrix(num_output,1);
  b1.rand();
  b2.rand();
  
// for the inputs we add 1 to add a bias 
inputs = new matrix(num_inputs ,1);
//inputs.rand();
// makeing the first weights matrix
w1 = new matrix (num_hidden,num_inputs);

w1.rand();
// makeing the secound weights matrix
// right now its without bias
w2 = new  matrix (num_output,num_hidden);
w2.rand();


// makeing the out puts
output = new matrix (num_output,1);




}


matrix feedforward(float[] _inputs){
// reconsucting the inputs 
 for (int i =0;i<_inputs.length;i++){
   inputs.set(i,0,_inputs[i]);
 
 }
 
 // we have reconstucted the inputs by this point

// frist step h1 = w1 X inputs
h1  = multi(w1,inputs);
h1.add(b1);
h1.sigmoid();

// secound step of the feed forward is 
output = multi(w2,h1);
output.add(b2);
output.sigmoid();



return output;
}


void train(float[] _inputs ,float[] ans ){

for (int i =0;i<_inputs.length;i++){
   inputs.set(i,0,_inputs[i]);
 
 }
 // we have reconstucted the inputs by this point

// frist step h1 = w1 X inputs
h1  = multi(w1,inputs);
h1.add(b1);
h1.sigmoid();

// secound step of the feed forward is 
output = multi(w2,h1);
output.add(b2);
output.sigmoid();

// this is where the train starts and feed forwards ends

// error stuff

matrix target = fromArray(ans);

matrix error_output = sub(target,output);


// now the hidden layers error is the traspose of (weights ) X error   its traspose due to moveing backwards 
// imgine you are going backwards so the errors are inputs and the inputs are the errors then the weight matrix should
// be the traspose of the forwards matrix and visa versa 
// look up codeing tran vid 10.15 to understand if you forgot abd you foool

matrix error_hidden    = multi( w2.traspose(),error_output) ;
// calulateing delta w1 and w2 full thing

// w2 = rate * dy/dx(sigmoid)*errors * traspose(h1)
// calulateing  gardient 
// frist section

matrix slop1 = h1.g_sigmoid();
slop1.multi_element(error_hidden);
slop1 = slop1.sclar(rate);


// secound section
matrix slop2 = output.g_sigmoid();
slop2.multi_element(error_output);
slop2 = slop2.sclar(rate);



matrix delta_weights1 = multi(slop1,inputs.traspose());

matrix delta_weights2 = multi(slop2 ,h1.traspose());

// adding them delta to w1 and w2
w1.add(delta_weights1);
w2.add(delta_weights2);
// bias is the slop without the x
b1.add(slop1);
b2.add(slop2);



}










}
