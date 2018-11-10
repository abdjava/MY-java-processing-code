class box {
BodyDef bd =  new BodyDef();
Body body ;
Vec2 pos = box2d.coordPixelsToWorld(0 ,0);
PolygonShape ps = new PolygonShape();
FixtureDef fd = new FixtureDef();
  
float x = 0;
float y =  0;
float h;
float w;
float box_fill =random(100,200);

 box (int x_ ,int y_){
 x= x_;
 y=y_;
 h = 16;
 w= 16;
   
   // box 2d settup
 bd.type = BodyType.DYNAMIC;
 bd.position.set(box2d.coordPixelsToWorld(x,y));
 body = box2d.createBody(bd);
 ps.setAsBox(box2d.scalarPixelsToWorld(w/2),box2d.scalarPixelsToWorld(h/2));
 fd.shape = ps;
 fd.density =1;
 fd.friction =0.3;
 fd.restitution =0.5;
 
 body.createFixture(fd);
 
 }

void display (){
  Vec2 location =box2d.getBodyPixelCoord(body);
  float angle = body.getAngle();
  pushMatrix();
  translate(location.x,location.y);
  rotate(-angle);
fill(box_fill);
rectMode(CENTER);
rect(0,0,w,h);
 popMatrix();

}




}