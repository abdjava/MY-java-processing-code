class perceptron {

float[] weights; // the last weight is allwasys the bias

float rate =0.01;



perceptron(int num_inputs){

weights =new float[num_inputs+1];
for (int i=0;i<num_inputs;i++){
weights[i] = random(-1,1);
}
}

perceptron (float[] weight){
weights =new float[weight.length];
weights = weight;
}




// funcations
//the guess funcation for this petular case of points
void guess (ArrayList<point> input){
  for (int i =0;i<input.size();i++){
     point p= input.get(i);
    
    float[] g = new float[2];
    g[0] = p.x;
    g[1]= p.y;
    
    float ans = guess(g);
    float error = p.type -ans;
        
   // changeing color based on error     
       if (error ==0){ p.correct =1;         }
       else {p.correct =0;    }

  }
}
// the really guess funcation
int guess (float[] inputs  ){
  float sum =0;
  for (int i =0;i<weights.length;i++){
  sum += inputs[i]*weights[i]; 
  
  }
  
  
  if (sum>=0){
  return 1;
  }
  else return -1;
  
}

void learn(ArrayList<point> input){
    // calculateing the error the frist part of the alogarthim
    
  for (int i =0;i<input.size();i++){
    point p= input.get(i);
    
    float[] g = new float[3];
    g[0] = p.x;
    g[1]= p.y;
    g[2]= height;
    
    float ans = guess(g);
    float error = p.type -ans;
        
   // changeing color based on error     
       if (error ==0){ p.correct =1;         }
       else {p.correct =0;    }
   
    // adujests the weights and bias
     for (int j =0; j< weights.length;j++){
     weights[j] += error  *g[j]* rate;
     
     }   
         printArray(weights);
  }

}





}
