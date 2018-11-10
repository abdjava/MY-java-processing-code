class felid {

int res =20;


int rows = height/res +1;
int collems = width/res +1;
PVector  vec[][] = new PVector [collems][rows];
// emtpy consuctor
felid(){
 
}



void begin(){
// will have logic about how the vectors in each part are made
float angle;
for (int i = 0 ;i<collems;i++){
  for (int j =0 ; j<rows;j++){
    angle =random(-PI/2, PI/2); //random();
  vec[i][j]=  PVector.fromAngle(angle).mult(10);
 // print("started ");
  }

}

}


void beginNoise(){
float angle;
float xoff=0;
float yoff=0;
for (int j =0 ;j<rows;j++){
  yoff= 0;
  for(int i = 0 ;i<collems;i++){
    angle =map(noise(yoff,xoff),0,1,0,2*PI);
    vec[i][j] =  PVector.fromAngle(angle).mult(10);
    yoff+=0.1;
  }
  xoff+=0.1;
}  

}





PVector wheretoflow(float x ,float  y ){
int i = (int)x/res;
int j = (int)y/res;
return vec[i][j].copy() ;
}

void display(){
for (int i = 0 ;i<collems;i++){
  for(int j =0 ; j<rows;j++){
    pushMatrix();
    stroke(100);
    strokeWeight(1);
   translate(i*res,j*res);
    line(0,0,vec[i][j].x,vec[i][j].y);
    popMatrix();
    
  }
}

}


}
