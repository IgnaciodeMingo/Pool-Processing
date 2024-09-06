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
