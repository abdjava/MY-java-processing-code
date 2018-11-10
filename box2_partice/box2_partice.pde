

// just impoarting all the shit for box 2d
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

// defineing variables
Box2DProcessing box2d; 


ArrayList<box> boxes;

void setup(){
// box 2d world settup
box2d = new Box2DProcessing(this);
box2d.createWorld();

box2d.setGravity(0,-10);

// makeing the processing sckech   
size (800,600);


boxes = new ArrayList();

}

void draw(){
  background(255);
  box2d.step();
if (mousePressed){
boxes.add(new box(mouseX,mouseY));

}
for (box b: boxes){

b.display();
print("farm rate = "+frameRate);
}

}