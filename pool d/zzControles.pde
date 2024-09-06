boolean isP,isA;

void keyPressed() {
  if (key == ENTER) isP = true;
  if (key == 'p'||key == 'P') isA = true;
  /*if (key == 'N' || key == 'n') {
   for (int i=BOLAS.size() - 1; i>=0; i--) {
   bola estabola = BOLAS.get(i);
   BOLAS.remove(estabola);
   }
   controjas=0;
   contazul=0;
   setup();
   tipodejuego = 1;
   }*/
}

void keyReleased() {
  if (key == 'p'||key == 'P') isA = false;
  if (key == ENTER) isP = false;
}
