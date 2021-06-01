//Clase
class Avion { 
  float posX;
  float posY;
  float w;
  PImage player;
  PImage explosion;
  
  //CONSTRUCTOR
  Avion(int posXinic, int posYinic){
  posX = posXinic;
  posY = posYinic;
  w = 22;
  player = loadImage("Avion.png");
   explosion = loadImage("Explosion torreta.png");
  }
  
  //METODOS
//Controles del mouse  
void update(){
if (keyPressed == true && key == CODED && keyCode == RIGHT){
  posX = posX + 6;
}
if (keyPressed == true && key == CODED && keyCode == LEFT){
  posX = posX - 6;
}
if (keyPressed == true && key == CODED && keyCode == DOWN){
  posY = posY + 6;
}
if (keyPressed == true && key == CODED && keyCode == UP){
  posY = posY - 6;
}

  }
  //Dibujo
  void ser(){
   ellipse(posX, posY-18, w, w);
   image(player, posX-67, posY-49);
  }
  //Avion derribado
  void derribado(){
    image( explosion, posX-57, posY-55);   
  }
}
