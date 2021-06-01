//Clase
class Tanque{
  float posX;
  float posY;
  float chasisX;
  float chasisY;
  float vel;
  float lim1;
  float lim2;
  float w;
  boolean vida;
  PImage tiger;
  PImage muerto;
  PImage explosion;

//CONSTRUCTOR
  Tanque(float velInicial, float posXinicial, float posYinicial, float limiteG1, float limiteP2){
    posX=posXinicial;
    posY=posYinicial;
    vel=velInicial;
    lim1 = limiteG1;
    lim2 = limiteP2;
    chasisX = posX;
    chasisY = posY;
    w = 34;
    tiger = loadImage("Tigerh1.png");
    muerto = loadImage("Tigerh1d.png");
    explosion = loadImage("Explosion torreta.png");
    
  }

//MOVIMEINTO
  void moverHorizontal(){
   posX=posX+vel;
   chasisX = chasisX+vel;
   if(posX>lim1 || posX <lim2){
     vel = vel * -1;
   }
 }
//DIBUJO
  void ser(){
    if(vida == false){
    ellipse(chasisX, chasisY, w, w);
    image(tiger, posX-47, posY-50);
    } 
    if(vida == true){
     image(muerto, posX-47, posY-50);
    }
  }
// Tanque bombardeado
  void muerto(){
    vel= 0;
     image(explosion, posX-47, posY-50);
  }
// Tanque exlotado
  void vida(){
    vida = true;
  }
}
