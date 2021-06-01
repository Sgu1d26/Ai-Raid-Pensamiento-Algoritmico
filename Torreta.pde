//Clase
class Torreta{
  float posX;
  float posY;
  float w;
  PImage explosion;

//CONSTRUCTOR
  Torreta( float posXinicial, float posYinicial){
    posX=posXinicial;
    posY=posYinicial;
    w = 33;
    explosion = loadImage("Explosion torreta.png");
  }
  
//DIBUJO
 void ser(){
   fill(117, 117, 119);
   ellipse(posX, posY, w, w);
    
 }

//torreta derribada
 void destru(){
  image( explosion, posX-50, posY-49);
   posX = posX*-100;
 }
}
