//Controles; 

//flechas: Movimiento de Avion
//Espacio: Disparar

//Objetivos;

//Destruir todos los enemigos
//las torretas se pueden desabilitar matando a los soldados que las usan con balas del avion
//Los tanques solo se pueden destruir cuando ya no quenden torretas puesto que ya no presentan un peligro para el avion
//los tanque no se pueden destruir con balas que estas son muy debiles para atravezar su armadura
//para bombardear los tanques se debe situar el avion justo arriba para que la bomba caiga en el lugar indicado
//las bombas se lanzan automaticamente

//tabla
Table puntajes;

//Contador Del Puntaje
int puntos = 0;
int Total = 0;
int one = 0;
int two = 0;
int tri = 0;
int four = 0;
int five = 0;

//Balas de las torretas
Bala [] balas;

//Balas de Tanques
BalaTan [] balatan;

//Balas del Avion
ArrayList<BalaX> balax;

//Nubes de escenario
Nubes uno;
Nubes dos;
Nubes tres;

//Tanque a destruir
Tanque tiger1;
Tanque tiger2;
Tanque tiger3;

//Avion del jugador
Avion jugador;

//Hitzones de las torretas
Torreta b1;
Torreta b2;
Torreta b3;
Torreta b4;

//Variables de estados
int estado;
int PANTALLAINIC = 0;
int JUEGO = 1;
int JUEGO2 = 5;
int REGLAS = 2;
int VICTORIA = 3;
int VICTORIA2 = 6;
int DERROTA = 4;

//Imagenes 
PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage Torreta1;
PImage Torretaf;
PImage explosion;
PImage Fondo;

//Requisitos de Victoria/Avanze del jueg0
boolean  Pri, Seg, Ter, Cuar, Quin, Sext;


void setup() {
  
  //Tamaño del lienso 
  size(844, 900);

  //Estado default
  estado = PANTALLAINIC;

  //Configuracion de clases
  
  //Tabla de puntos
  puntajes = loadTable("tabla.csv", "header");
  
  //Balas de torreta
  balas = new Bala[4];
    balas[0] = new Bala(121, 320, 320, 2);
    balas[1] = new Bala(369, 455, 455, 2);
    balas[2] = new Bala(468, 115, 115, 2);
    balas[3] = new Bala(719, 140, 140, 2);

  //Balas de Avion
  balax = new ArrayList<BalaX>();

  //Hitzones de las torretas
  b1 = new Torreta(122, 308);
  b2 = new Torreta(369, 455);
  b3 = new Torreta(468, 115);
  b4 = new Torreta(719, 140);
 
  //Nubes
  uno = new Nubes(0.9, 99, 132);
  dos = new Nubes(0.9, 375, 553);
  tres = new Nubes(0.9, 840, 320);
  
  //Tanques
  tiger1 = new Tanque(1, 200, 170, 271, 19);
  tiger2 = new Tanque(1, 275, 310, 589, 229);
  
  //Bala Tanque
  balatan = new BalaTan[2];
  balatan[0] = new BalaTan(tiger1.posX, tiger1.posY,  5, tiger1);
  balatan[1] = new BalaTan(tiger2.posX, tiger2.posY,  5, tiger2); 
  
  //Avion
  jugador = new Avion(width/2+200, 850);
  
  //Archivos de imagenes
  img = loadImage("uno.png");
  img2 = loadImage("dos.png");
  img3 = loadImage("tres.png");
  img4 = loadImage("4.png");
  Torreta1 = loadImage("TorretaP.png");
  Torretaf = loadImage("TorretaD.png");
  Fondo = loadImage("fondo.png");
  
  //Requisitos de Victoria/Avanze del jueg0
  Pri = false;
  Seg = false;
  Ter = false;
  Cuar = false;
  Quin = false;
  Sext = false;
}


void draw() {
  
  if (estado == PANTALLAINIC) { //Pantalla de inicio con botones
    background(0);
    image(img, 0, 0);
  } else if (estado == REGLAS) { //Pantalla de objetivo del juego
    background(0);
    image(img2, 0, 0);
  } else if (estado == JUEGO) { //Pantalla de juego
  
   //Fondo paisaje
    image(Fondo, 0, 0);
   
   //Hitzones de las torretas
    b1.ser();
    b2.ser();
    b3.ser();
    b4.ser();
    
   //Tanques dibujar
    tiger1.moverHorizontal();
    tiger1.ser();
    tiger2.moverHorizontal();
    tiger2.ser();
    
   //Requizitos de bombardeo para tanques 
   if (Pri == true && Seg == true && Ter == true && Cuar == true){
    if(bombardeado(tiger1, jugador) == true) { //jugador bombardea a tanque 1
      tiger1.muerto(); //Tanque se deja de mover
      tiger1.vida();// Explosion de la bomba
      Quin = true; // Requizito
      balatan[0].destruida();//Colision 
     }
     
    if(bombardeado(tiger2, jugador) == true) { //juagador bombardea a tanque 2
      tiger2.muerto(); //mismo orden que arriba
      tiger2.vida();//Tanque se deja de mover
      Sext = true;// Requizito
      balatan[1].destruida();//Colision
     }
    }
    
   //Requizito para ganar puntos con bombardeo
    if (Quin == true && Sext == true){
      puntos = puntos +2; //puntos
      five = five +2; // puntos
    }
    
    
   //Balas de torreta 
    for (int i = 0; i < 4; i++) { 
      balas[0].moverVertical();
      balas[0].ser();
      balas[1].moverVertical();
      balas[1].ser();
      balas[2].moverVertical();
      balas[2].ser();
      balas[3].moverVertical();
      balas[3].ser();
   
   if (impacto(jugador, balas[i]) == true) { //Impacto de balas con jugador cambio de estado a derrota
        balas[i].destruida();//Colision
        jugador.derribado();//Colision      
        estado = DERROTA;//Estado cambio
      }
    }    
        
  //Sprites de las torretas      
  if(Pri == true){
      image(Torretaf, 122-42.9, 308-50);
   } 
  else{  
      image(Torreta1, 122-42.9, 308-50);
   }
  if(Seg == true){
      image(Torretaf, 369-42.9, 455-50);
   }
  else{
      image(Torreta1, 369-42.9, 455-50);
   }
  if(Ter == true){
      image(Torretaf, 468-42.1, 115-50);
   }
  else{
      image(Torreta1, 468-42.1, 115-50);
   }
  if(Cuar == true){
     image(Torretaf, 712-35, 145-50 );
   }
  else{
     image(Torreta1, 712-35, 145-50);
   }
    
   //Balas del jugador 
    for (int i = balax.size()-1; i >= 0; i--) {  //Arraylist de las balas disparadas por el jugador
      BalaX bal = balax.get(i);//tomar del array
      bal.moverVertical();//Mover
      bal.ser();//dibujar
              
     if (destruido(b1, bal) == true) { //Jugador destrulle la torreta 1      
       bal.choque();//Reset de bala 
       balas[0].destruida();//Torreta deje disparar
       b1.destru();//Animacion hitzone torreta
       Pri = true;//Requizito
       puntos = puntos + 1;//puntos
       one = one +1;//puntos
      }
     if(destruido2(b2, bal) == true) { //Jugador destrulle la torreta 2
       bal.choque(); //Efecto de choque 
       balas[1].destruida();//Torreta deje disparar
       b2.destru();//Animacion hitzone torreta
       Seg = true; // Requizito
       puntos = puntos + 1 ; //puntos
       two = two +1; //puntos
     }
      if(destruido3(b3, bal) == true) { //Jugador destrulle la torreta 3
       bal.choque(); //Mismo orden que antes
       balas[2].destruida();
       b3.destru();
       Ter = true;
       puntos = puntos + 1 ;
       tri = tri +1;
     }
        if(destruido4(b4, bal) == true) { //Jugador destrulle la torreta 3
       bal.choque(); //Mismo orden que antes
       balas[3].destruida();
       b4.destru();
       Cuar = true;
       puntos = puntos + 1 ;
       four = four +1;
     }
    }
    
  //Moviemto del jugador y dibujo
   jugador.update();
   jugador.ser();
 
 //Balas de los Tanques 
   balatan[0].moverVertical();
   balatan[0].ser();
   balatan[1].moverVertical();
   balatan[1].ser();
   
        if (impacto2(jugador, balatan[0]) == true) { //Impacto de balas con jugador cambio de estado a derrota
        jugador.derribado();      
        estado = DERROTA;
      }
       if (impacto2(jugador, balatan[1]) == true) { //Impacto de balas con jugador cambio de estado a derr
        jugador.derribado();      
        estado = DERROTA;
      }
    
   //Nubes mover y dibujar
   uno.moverHorizontal();
   uno.ser();
   dos.moverHorizontal();
   dos.ser();
   tres.moverHorizontal();
   tres.ser();
    
    //Contador de texto    
    textSize(32);
    text("Cofirmed kills : " + puntos, 20, 50);
   
   //requizito de victoria total
    if (Pri == true && Seg == true && Ter == true && Cuar == true && Quin == true && Sext == true){
      estado = VICTORIA;
    }
      
  } else if (estado == VICTORIA) { //Pantalla de victoria
    image(img3, 0, 0);//Imagen de derrota
    //titulo honorario
    if(puntos == 6){
      fill(255);
      text("Air Ace", width/2-50, 800);
      }
    //Calculo total de puntos
 Total = one + two + tri + four + five;
      
  } else if (estado == DERROTA) { //Pantalla de derrota
    image(img4, 0, 0); 
    //titulo Honorario
     if(puntos == 1){
       fill(255);
       text("Airman", width/2-50, 800);
      }
      if(puntos == 2){
       fill(255);
       text(" Airman First Class", width/2-45, 800);
      }
      if(puntos == 3){
        fill(255);
        text("Senior Airman", width/2-45, 800);
      }
 
      //Calculo total de puntos
     Total = one + two + tri + four + five;
  }
}

// Disparo del jugador
void keyReleased() {
  if (key == ' ') {
    balax.add(new BalaX(jugador.posX, jugador.posY, jugador.posX, 10));
  }
} 

void mouseReleased() { //Controles de usuario para estados

//menu a juego 
  if (mouseY > 735 && mouseY < 766 && mouseX > 270 && mouseX < 590 && estado == PANTALLAINIC) {
    estado = JUEGO;
    
//menu a reglas  
  } else if (mouseY > 784 && mouseY < 816 && mouseX > 270 && mouseX < 590 && estado == PANTALLAINIC) {
    estado = REGLAS;
    
//Reglas a menu
  } else if (mouseY > 30 && mouseY < 65 && mouseX > 52 && mouseX < 152 && estado == REGLAS) {
    estado = PANTALLAINIC;
    
//Victoria
  } else if (mouseY <= height && mouseX <= height && estado == VICTORIA) {
 
     //Setup de tabla
        int mes = month();
        int dia = day();
        int hora = hour();
        int minutos =minute();
        
        String fecha_juego = mes+"-"+dia+" "+hora+"-"+minutos;
        
        TableRow nuevaFila =puntajes.addRow();
        nuevaFila.setInt("puntaje", Total);
        nuevaFila.setString("fecha", fecha_juego);
        
        saveTable(puntajes, "data/tabla.csv");
     
    //reset de clases y variables cuando se va al menu
       estado = PANTALLAINIC;
       jugador = new Avion(width/2, 850);
       balas = new Bala[100];
      
     for (int i = 0; i < 4; i++) { 
       balas[0] = new Bala(121, 320, 320, 2);
       balas[1] = new Bala(369, 455, 455, 2);
       balas[2] = new Bala(468, 115, 115, 2);
       balas[3] = new Bala(719, 140, 140, 2);
  }
       tiger1 = new Tanque(1, 200, 170, 271, 19);
       tiger2 = new Tanque(1, 275, 310, 589, 229);
    
     for (int i = balax.size()-1; i >= 0; i--) { 
       BalaX bal = balax.get(i);
       bal.moverVertical();
       bal.ser();
       bal.choque();  
 }
       Pri = false;
       Seg = false;
       Ter = false;
       Cuar = false;
       Quin = false;
       Sext = false;
  
       b1 = new Torreta(122, 308);
       b2 = new Torreta(369, 455);
       b3 = new Torreta(468, 115);
       b4 = new Torreta(719, 140);
 
       puntos = 0;
  
       balatan = new BalaTan[2];
       balatan[0] = new BalaTan(tiger1.posX, tiger1.posY,  5, tiger1);
       balatan[1] = new BalaTan(tiger2.posX, tiger2.posY,  5, tiger2); 

 
//Derrota
 } else if (mouseY <= height && mouseX <= height && estado == DERROTA) {
   
   //Setup de tabla
      int mes = month();
      int dia = day();
      int hora = hour();
      int minutos =minute();
        
      String fecha_juego = mes+"-"+dia+" "+hora+"-"+minutos;
        
      TableRow nuevaFila =puntajes.addRow();
      nuevaFila.setInt("puntaje", Total);
      nuevaFila.setString("fecha", fecha_juego);
        
      saveTable(puntajes, "data/tabla.csv");
   
   //reset de clases y variables cuando se va al menu
   
      estado = PANTALLAINIC;
      balas = new Bala[100];
    for (int i = 0; i < 4; i++) { 
      balas[0] = new Bala(121, 320, 320, 2);
      balas[1] = new Bala(369, 455, 455, 2);
      balas[2] = new Bala(468, 115, 115, 2);
      balas[3] = new Bala(719, 140, 140, 2);
  }
    for (int i = balax.size()-1; i >= 0; i--) { 
      BalaX bal = balax.get(i);
      bal.moverVertical();
      bal.ser();
      bal.choque();    
  }
      tiger1 = new Tanque(1, 200, 170, 271, 19);
      tiger2 = new Tanque(1, 275, 310, 589, 229);
  }
      b1 = new Torreta(122, 308);
      b2 = new Torreta(369, 455);
      b3 = new Torreta(468, 115);
      b4 = new Torreta(719, 140);
 
      puntos = 0;
 
      balatan = new BalaTan[2];
      balatan[0] = new BalaTan(tiger1.posX, tiger1.posY,  5, tiger1);
      balatan[1] = new BalaTan(tiger2.posX, tiger2.posY,  5, tiger2); 
   
     Pri = false;
     Seg = false;
     Ter = false;
     Cuar = false;
     Quin = false;
     Sext = false;
  
    jugador = new Avion(width/2+200, 850);
} 

//Calculo de impactos
boolean impacto(Avion jugador, Bala balas) { //Jugador derribado
  float distancia = dist(balas.posX, balas.posY, jugador.posX, jugador.posY);
  if (distancia < (balas.w/2 + jugador.w/2)) {
    return true;
  } else {
    return false;
  }
}
boolean destruido(Torreta b1, BalaX balax){ //Torreta derribada
  float distancia1 = dist(balax.posX, balax.posY, b1.posX, b1.posY);
  if (distancia1 < (balax.w/2 + b1.w/2)){
    return true;
  } else {
    return false;
}
}
boolean destruido2(Torreta b2, BalaX balax){ //Torreta derribada
  float distancia2 = dist(balax.posX, balax.posY, b2.posX, b2.posY);
  if (distancia2 < (balax.w/2 + b1.w/2)){
    return true;
  } else {
    return false;
 }
}

boolean destruido3(Torreta b3, BalaX balax){ //Torreta derribada
  float distancia3 = dist(balax.posX, balax.posY, b3.posX, b3.posY);
  if (distancia3 < (balax.w/2 + b1.w/2)){
    return true;
  } else {
    return false;
 }
}

boolean destruido4(Torreta b4, BalaX balax){ //Torreta derribada
  float distancia4 = dist(balax.posX, balax.posY, b4.posX, b4.posY);
  if (distancia4 < (balax.w/2 + b1.w/2)){
    return true;
  } else {
    return false;
 }
}

boolean bombardeado(Tanque tiger1 , Avion jugador){ //tanque bombardeado
  float distancia5 = dist(tiger1.posX, tiger1.posY, jugador.posX, jugador.posY);
  if (distancia5 < (tiger1.w/2 + jugador.w/2)){
    return true;
  } else {
    return false;
 }
}
 
boolean bombardeado2(Tanque tiger2 , Avion jugador){ //tanque bombardeado
  float distancia6 = dist(tiger2.posX, tiger2.posY, jugador.posX, jugador.posY);
  if (distancia6 < (tiger2.w/2 + jugador.w/2)){
    return true;
  } else {
    return false;
 }
}

boolean impacto2(Avion jugador, BalaTan balatan) { //Jugador derribado
  float distancia = dist(balatan.posX, balatan.posY, jugador.posX, jugador.posY);
  if (distancia < (balatan.w/2 + jugador.w/2)) {
    return true;
  } else {
    return false;
  }
}
