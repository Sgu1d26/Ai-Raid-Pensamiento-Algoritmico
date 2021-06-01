//Clase
class Nubes{
  float posX;
  float posY;
  float vel;
  PImage nubes;
  PImage nube2;
  
  //CONSTRUCTOR
  Nubes(float velInicial, float posXinicial, float posYinicial){
    posX=posXinicial;
    posY=posYinicial;
    vel=velInicial;
    nubes = loadImage("Nubes.png");
    nube2 = loadImage("nube2.png");
  }
 //METODOS  
//Movimiento - desplazamiento horizontal  
  void moverHorizontal(){
   posX=posX+vel;
   if(posX>844 || posX <0){
     vel = vel * -1;
   }
  }
 //Dibujo
void ser(){
 image(nubes, posX-140, posY-90);
 image(nube2, posX+30, posY-20);
 }
}
