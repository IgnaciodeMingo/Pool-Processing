void menu() {
  PImage ARGENTINA;
  ARGENTINA = loadImage("2.jpg");
  ARGENTINA.resize(900, 500);
  translate(width/2, height/2);
  image(ARGENTINA, -450, -250);

  if (isP) {
    isP = false;
    tipodejuego = 1;
  }
  if (isA) {
    isA = false;
    tipodejuego = 4;
  }
}
