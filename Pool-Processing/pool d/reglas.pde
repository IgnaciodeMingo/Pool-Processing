void reglas() {
  PImage fondo;
  fondo = loadImage("1.jpg");
  fondo.resize(900, 500);
  translate(width/2, height/2);
  image (fondo, -height+50, -250);
  
 
  if (isA) {
    isA = false;
    tipodejuego = 1;
  }
}
