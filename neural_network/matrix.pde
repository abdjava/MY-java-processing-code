// kinda like the static version of the thing not really but gets the job done
matrix multi(matrix m1,matrix m2){
if( !(m1.cols == m2.rows)){
  
   print(" invalid matrix multi   ");
  return null;
}



else {
matrix r = new matrix(m1.rows,m2.cols);

  for (int i =0;i<r.rows;i++){
    for(int j=0;j<r.cols;j++){
      float sum =0;
      for(int k=0 ;k<m1.cols;k++){
      sum += m1.matrix[i][k] *m2.matrix[k][j] ;
        
      }
      r.matrix[i][j] = sum;
    
    }
  }
  return r;
}



}

matrix fromArray( float[] input){

 matrix  r  = new matrix(input.length,1);
  for (int i =0;i<input.length;i++){
  r.matrix[i][0] = input[i];
  
  }
return r;
}

matrix sub(matrix m1 ,matrix m2){

  matrix sub = m2.sclar(-1);
  matrix r = m1;
  r.add(sub);
  return r;
}



//  here the matrix class
public class matrix{

int rows,cols;
float[][] matrix;




matrix(int _rows,int _cols){

 rows =_rows;
 cols=_cols;
  matrix = new float[rows][cols];
}
matrix (float[][] mat){
matrix =mat;
cols = mat[0].length;
rows =mat.length;


}


void rand(){
    // giveing all the elements in the matrix a random value 
  for (int i =0;i<rows;i++){
    for(int j=0;j<cols;j++){
    matrix[i][j] = random(-1,1);
    
    }
  }

}

void rand(float n){
    // giveing all the elements in the matrix a random value 
  for (int i =0;i<rows;i++){
    for(int j=0;j<cols;j++){
    matrix[i][j] = random(-n,n);
    
    }
  }



}




matrix sclar(float n){
  matrix r = new matrix (rows,cols);
  
  for (int i =0;i<rows;i++){
    for(int j=0;j<cols;j++){
    r.matrix[i][j] = matrix[i][j]*n;
    
    }
  }

return r;
}

void add(float n){
 for (int i =0;i<rows;i++){
    for(int j=0;j<cols;j++){
    matrix[i][j] +=n;
    
    }
  }



}

void add(matrix n){
  if (!(rows== n.rows&& cols ==n.cols)){
  print(" matrix add is invalid     "  );
  
  }
  
  
 for (int i =0;i<rows;i++){
    for(int j=0;j<cols;j++){
    matrix[i][j] +=n.matrix[i][j];
    
    }
  }


}







// non static function
matrix multi(matrix m){
if( !(cols == m.rows)){
  
   print(" invalid matrix multi   ");
  return null;
}
else {
matrix r = new matrix(rows,m.cols);

  for (int i =0;i<r.rows;i++){
    for(int j=0;j<r.cols;j++){
      float sum =0;
      for(int k=0 ;k<cols;k++){
      sum += matrix[i][k] *m.matrix[k][j] ;
        
      }
      r.matrix[i][j] = sum;
    
    }
  }
  return r;
}



}

matrix traspose(){
matrix r = new matrix(cols,rows) ;
  for(int i =0;i<rows;i++){
    for(int j =0;j<cols;j++){
    
      r.matrix[j][i] = matrix[i][j];
    }
  }

return r;

}

// sigmoid
void sigmoid(){
  
  for(int i =0;i<rows;i++){
    for(int j =0;j<cols;j++){
    
      matrix[i][j] = 1/(1+exp( -matrix[i][j]) );
    }
  }



}

matrix g_sigmoid(){
 matrix r = new matrix(rows,cols);
  
 for(int i =0;i<rows;i++){
    for(int j =0;j<cols;j++){
    
      r.matrix[i][j] = matrix[i][j]*(1-matrix[i][j]);
    }
  }

return r;

}

void set (int i ,int j  , float value ){

matrix[i][j] = value;


}

float [] toArray(){

float[] r  = new float[matrix.length];

for (int i =0 ;i<matrix.length;i++){
  
r[i] = matrix[i][0];

}


return r;
}


void multi_element (matrix m){
  if(m.rows == rows && m.cols == cols){
  

 for(int i =0;i<rows;i++){
    for(int j =0;j<cols;j++){
    
      matrix[i][j] *= m.matrix[i][j]; 
    }
  }
  }
  else {
  print ("the element vis multipcation is invalid due to cols and rows not matching   ");
  
  }



}




}
