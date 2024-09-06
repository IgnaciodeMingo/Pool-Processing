
PVector mouse;
PImage pool, palo;
int tipodejuego;
ArrayList <bola> BOLAS = new ArrayList <bola>();
ArrayList <bola> NEGRAS = new ArrayList <bola>();
bola B, N;
int controjas, contazul, turno, turnosRojos, turnosAzules;
boolean jugar, turnoCambio, nuevo;
void setup() {
  size(900, 500);
  palo = loadImage("palo.png");
  palo.resize(50, 300);
  pool = loadImage("pool.png");

  mouse = new PVector(mouseX, mouseY);
  B = new bola(width/2-200, height/2);
  B.c = 255;
  BOLAS.add(new bola(width/2+100, height/2));
  BOLAS.add(new bola(width/2+160, height/2));
  BOLAS.add(new bola(width/2+160, height/2+40));
  BOLAS.add(new bola(width/2+160, height/2-40));
  BOLAS.add(new bola(width/2+190, height/2-60));
  BOLAS.add(new bola(width/2+220, height/2+40));
  BOLAS.add(new bola(width/2+220, height/2-40));
  BOLAS.add(new bola(width/2+130, height/2+20));
  BOLAS.add(new bola(width/2+130, height/2-20));
  BOLAS.add(new bola(width/2+190, height/2+60));
  BOLAS.add(new bola(width/2+220, height/2+80));
  BOLAS.add(new bola(width/2+190, height/2-20));
  BOLAS.add(new bola(width/2+220, height/2));
  BOLAS.add(new bola(width/2+220, height/2-80));
  N = new bola(width/2+190, height/2+20);

  for (int i=0; i<BOLAS.size(); i++) {
    bola estabola = BOLAS.get(i);
    if (i%2 == 0) {
      estabola.c = color(255, 0, 0);
    } else {
      estabola.c = color(0, 0, 255);
    }
  }

  NEGRAS.add(new bola(450, 458));
  NEGRAS.add(new bola(450, 44));
  NEGRAS.add(new bola(43, 458));
  NEGRAS.add(new bola(50, 50));
  NEGRAS.add(new bola(849, 450));
  NEGRAS.add(new bola(848, 52));

  turno = 1;
  turnosAzules = 1;
}
void draw() {
  mouse = new PVector(mouseX, mouseY);
  switch(tipodejuego) {
  case 0:
    menu();
    break;

  case 1:
    gameplay();
    break;

  case 2:
    ganadorazul();
    break;

  case 3:
    ganadorrojo();
    break;
  case 4:
  reglas();
  break;
  }
  /*if (keyPressed) {
   if (key == 'N' || key == 'n') {
   for (int i=BOLAS.size() - 1; i>=0; i--) {
   bola estabola = BOLAS.get(i);
   BOLAS.remove(estabola);
   }
   controjas=0;
   contazul=0;
   setup();
   tipodejuego=1;
   }
   }*/
}
void mouseReleased() {
  if (tipodejuego==1) {
    tirodebolablanca();
  }
}
