walk w ;


void setup(){
size (500,500);
background(200);

w = new walk(200,100);
}

void draw(){

    w.render();
    //w.move_random(1);
    w.move_real(2);


}