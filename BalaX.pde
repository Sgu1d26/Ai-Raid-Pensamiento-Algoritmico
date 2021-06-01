//Clase
class BalaX{
  float posX;
  float posY;
  float vel;
  float avionX;
  float w;
  
  //CONSTRUCTOR
  public BalaX(float posXinicial, float posYinicial, float origen, int velInic){
   posX=posXinicial;
   posY=posYinicial;
   avionX = origen;
   vel= velInic;
   w=12;
  }

//METODOS
//Movimiento - Desplazamiento Vertical
void moverVertical(){
 posY=posY-vel;

}
//Dibujo
  void ser(){
   fill(67, 67, 69);
   ellipse(posX, posY, w, w);
}  
//Colision con objeto
 void choque(){
   posY = posY * -20;
   }
} 
