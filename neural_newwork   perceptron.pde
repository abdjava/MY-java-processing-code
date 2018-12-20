perceptron p ;
float[] in = {2.2,8.9};
ArrayList<point> points ;
// m and c
float m =0,c=4;


void setup(){
size(800,800);
 points = new ArrayList();
p = new perceptron(2);


for (int i =0; i<100;i++){
points.add(i,new point(random(width),random(height)));
// makeing the line 
points.get(i).funcation(m,c);
}
}


void draw(){
background(255);

for (int i =0;i<points.size();i++){
points.get(i).display();

}
stroke(0,255,0);
//make(m,c);
stroke(100,100,240);
make (p);

//p.guess(points);
p.learn(points);


}


void mousePressed(){

p.learn(points);
}

void make(float m ,float c){
float x1 = 0;
float y1 = m*x1+100*c;
float x2 = width;
float y2 = m*x2+100*c;
 //y2 = map(y2 ,0,height,height,0);
 //y1 = map(y1 ,0,height,height,0);
line(x1,y1,x2,y2);
}

void make(perceptron p){
// y *w1 = - (x*w0 +w3)   so m = w0/w1
float m = -p.weights[0]/p.weights[1];
float c =height* -p.weights[2]/p.weights[1];

print ( " m = "+ m + "  c = " +c   );
make (m,c);
}
