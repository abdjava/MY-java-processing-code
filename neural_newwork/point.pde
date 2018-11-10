class point {

float x , y,px,py;
int type ;
int correct =0;
// constuctor with PVector
point(){
x = random(-1,1);
y= random(-1,1);

 if (x>y){
  type = -1;
  }
  else {
  type = +1;
  }
py =map(y,-1,1,height,0);
px = map(x,-1,1,0,width);
}



//constuctor with x and y
point(float x_ ,float y_){
  x=x_;
  y=y_;
  if (x>y){
  type = -1;
  }
  else {
  type = +1;
  }
  px =map(x, 0,width ,0,width);
  py =map(y,0,height ,height,0);

}

// color depends on if type 1 or type 2 
void display(){
  if (type==1&& correct ==0){
  fill(0,0,255);
  }
  else if (correct ==0){
  fill(255,0,255);
  }
  else if(correct ==1){
    fill(0,255,0);
  }
  
  ellipse(px,py,10,10);
}

void funcation(float m,float c){
// y =mx+c
float line_y = m*x+100*c;
if (y>line_y){
type = +1;
}
else type = -1;

}



}
