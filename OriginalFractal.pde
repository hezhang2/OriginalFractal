//Helen Zhang, Block 1, OriginalFrac+al, 2/13/2016
private float theLen=185;
private float theFill=0;
private int theBran=0;
private int progDeg=0;
private boolean add=true;
public void setup() {
  strokeWeight(.5);
  size(600, 600);
}
public void draw() {
  background(0); 
  if(progDeg<360){
    progDeg++;
  }else{
    progDeg=0;
  }
  double progression = progDeg*(Math.PI/180);
  theFill=225*sin((float)progression);
  if(theBran>3){
    add=false;
  }
  if(theBran<1){
    add=true;
  }
  if(theFill==0){
    if(add==true){
      theBran++;
    }else{
      theBran--;
    }
  }
  stroke(Math.abs(theFill));
  snowFrac(300,300,theLen,theBran);
}
public void snowFrac(float x, float y, float len, int bran) {
  int turn;
  if(bran%2==0)
    turn=0;
  else
    turn=30;  
  for (int m=turn; m<360+turn; m+=60) {
    double rad = m*(Math.PI/180);
    line(x, y, x+(float)(Math.cos(rad)*len), y+(float)(Math.sin(rad)*len));
    if (bran>0) {
      snowFrac(x+(float)(Math.cos(rad)*len), 
      y+(float)(Math.sin(rad)*len),
      len/2.75,
      bran-1);
    }
  }
}
