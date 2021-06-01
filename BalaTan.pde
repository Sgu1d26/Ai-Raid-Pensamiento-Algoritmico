//Clase
class BalaTan{
  float posX;
  float posY;
  float vel;
  float torretaX;
  float w;
  Tanque tanqorigen;
  
  //CONSTRUCTOR
  BalaTan(float posXinicial, float posYinicial, float velInic, Tanque PosInc ){
   posX=posXinicial;
   posY=posYinicial;
   tanqorigen = PosInc;
   vel= velInic;
   w=12;
  }

//METODOS
//Movimiento - Desplazamiento Vertical
void moverVertical(){
 posY=posY+vel;
 if(posY > 1003){
   posY= tanqorigen.posY;
   posX= tanqorigen.posX;
 }
}
//Dibujo
  void ser(){
   fill(67, 67, 69);
   ellipse(posX, posY+40, w, w);
}
//Reset a posicion inicial
void reset(){
  posY = tanqorigen.posY;
}  
//torreta destruida alto de fuego
 void destruida(){
   posY = 50*-100;
     vel = 0;
   }
} 
