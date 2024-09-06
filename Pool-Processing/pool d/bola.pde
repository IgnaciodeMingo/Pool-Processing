
class bola {
  PVector vel, pos, acc;
  int radio = 15;
  color c;
  bola(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  void acelerar(PVector F) {
    acc.add(F);
  }
  void mostrar() {
    fill(c);
    circle(pos.x, pos.y, radio);
    ellipseMode(RADIUS);
  }

  void mover() {
    vel.add(acc);
    acc.mult(0);
    pos.add(vel);
    rebotar();
    
    vel.mult(0.985); //para que vaya decreciendo la velocidad
    if (vel.mag()<0.15) { //para que frene directo si va lento
      vel.mult(0);
    }
  }
  void rebotar() {
    if (pos.x>=855-radio||pos.x<47+radio) {
      pos.sub(vel);
      vel.x=vel.x*(-1);
    }
    if (pos.y>=456-radio||pos.y<45+radio) {
      pos.sub(vel);
      vel.y=vel.y*(-1);
    }
  }
  boolean ChocaCon(bola D) {
    float suma;
    float distancia;
    suma=radio+D.radio;
    distancia = dist(D.pos.x, D.pos.y, pos.x, pos.y);
    if (suma<distancia) {
      return false;
    } else {
      return true;
    }
  }
  void separar(PVector jp, PVector jvel) {
    PVector a = new PVector(jp.x, jp.y);
    a.sub(pos);
    a.setMag(jvel.mag());
    a.mult(-0.4);
    acelerar(a);
  }

  void pintar(color c) {
    fill(c);
  }
}
