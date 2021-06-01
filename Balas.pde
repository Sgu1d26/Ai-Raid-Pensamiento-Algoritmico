//Clase
class Bala{
  float posX;
  float posY;
  float vel;
  float torretaX;
  float w;
  
  //CONSTRUCTOR
  Bala(float posXinicial, float posYinicial, float Tfinal, float velInic){
   posX=posXinicial;
   posY=posYinicial;
   torretaX= Tfinal;
   vel= velInic;
   w=12;
  }

//METODOS
//Movimiento - Desplazamiento Vertical
void moverVertical(){
 posY=posY+vel;
 if(posY > 1003){
   posY=torretaX;
 }
}
//Dibujo
  void ser(){
   fill(67, 67, 69);
   ellipse(posX, posY, w, w);
}
//Reset a posicion inicial
void reset(){
  posY = torretaX;
     
}  
//torreta destruida alto de fuego
 void destruida(){
     vel = 0;
     posY = posY+ 50*-100;
   }
} 
