void ganadorazul() {
  PImage azul;
  azul = loadImage("fondoazul.jpg");
  image(azul, 0, 0);
  textSize(50);
  fill(255);
  textAlign(CENTER, CENTER);
  text("GANARON LAS AZULES", width/2, height/2);
  /*text("Presiona N para comenzar de nuevo",width/2,height-100);
   textSize(20);*/
}

void ganadorrojo() {
  PImage rojo;
  rojo = loadImage("fondorojo.jpg");
  image(rojo, 0, 0);
  textSize(50);
  fill(255);
  textAlign(CENTER, CENTER);
  text("GANARON LAS ROJAS", width/2, height/2);
  /*text("Presiona N para comenzar de nuevo",width/2,height-100);
   textSize(20);*/
}
