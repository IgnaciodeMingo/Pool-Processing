void tirodebolablanca() {
  if (jugar) {
    PVector dif;
    dif = new PVector(B.pos.x, B.pos.y);
    dif.sub(mouse);
    float dif_x = map(dif.x, 0, 150, 0, 4);           //literalmente, para que la bola TAN a narnia
    float dif_y = map(dif.y, 0, 150, 0, 4);
    dif.set(dif_x, dif_y);
    B.acelerar(dif);

    turnoCambio = true;
  }
}
void palo() {
  PVector gap;
  gap = new PVector(B.pos.x, B.pos.y);
  gap.sub(mouse);
  float dif_x = map(gap.x, 0, 200, 0, 5);
  float dif_y = map(gap.y, 0, 200, 0, 5);
  gap.set(dif_x, dif_y);


  PVector dif;
  float range;
  dif = new PVector(B.pos.x, B.pos.y);
  dif.sub(mouse);
  pushMatrix();

  float rX = mouse.x - B.pos.x;
  float rY = mouse.y - B.pos.y;

  translate(B.pos.x, B.pos.y);

  if (rY < 0) {
    range = atan(rX / rY) + radians(180);
  } else {
    range = atan(rX / rY);
  }

  rotate(-range);
  image(palo, -25, 15 + (gap.mag() * 10) );
  popMatrix();
}
