

byte[] data ;
byte[] output = new byte[784*1000];
void setup(){
size(784,784);
 data = loadBytes("airplane.npy");

// printing img
int outindex =0;
for(int j =0;j<28*28;j++){
PImage img = createImage(28,28,RGB);
int start = 80 +784*j;
for (int i=0 ;i<784;i++){

int indes = i+start;
byte val = data[indes];
output[outindex++] = val;

img.pixels[i]=color(255- val &0xff);
}

img.updatePixels();
image(img,(int)(j%28)*28,(int)(j/28)*28);
}
saveBytes("airplane1000.bin",output);
}


void draw (){




}
