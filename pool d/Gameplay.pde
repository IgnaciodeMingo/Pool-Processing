void gameplay() {
  image(pool, 0, 0);


  for (int i=0; i<BOLAS.size(); i++) {
    bola estabola = BOLAS.get(i);
    for (int j=0; j<BOLAS.size(); j++) {
      bola otrabola = BOLAS.get(j);
      if (estabola.ChocaCon(otrabola)) {
        estabola.separar(otrabola.pos, otrabola.vel);           //colisión entre azules y/o rojas con azules y/o rojas
      }
    }
    if (B.ChocaCon(estabola)) {
      if(nuevo==false   ){
      B.separar(estabola.pos, estabola.vel);           //colisión de blanca con azules y/o rojas
      estabola.separar(B.pos, B.vel);}
    }
    if (N.ChocaCon(estabola)) {
      N.separar(estabola.pos, estabola.vel);   //colisión de negra con azules y/o rojas
      estabola.separar(N.pos, N.vel);
    }
  }

  for (int i=BOLAS.size() - 1; i>=0; i--) {
    bola estabola = BOLAS.get(i);
    for (int x=0; x<NEGRAS.size(); x++) {
      bola esquina = NEGRAS.get(x);
      if (estabola.ChocaCon(esquina)) {
        if (estabola.c == color(255, 0, 0)) {
          controjas++;
          if (turno == 1) {
            turnosAzules = 0;                                            //entra bola roja suma contador y cambia el turno de azul a rojo
          }
          if ( turno == 2) {
            turnosRojos = 2;
          }
        } else if (estabola.c == color(0, 0, 255)) {
          contazul++;                                           //entra bola azul suma contador y cambia el turno de rojo a azul
          if (turno == 1) {
            turnosAzules = 2;                                            //entra bola roja suma contador y cambia el turno de azul a rojo
          }
          if ( turno == 2) {
            turnosRojos = 0;
          }
        }
        BOLAS.remove(estabola);     //el for invertido y el remove para hacer desaparecer las bolas que toquen las esquinas
      }
    }
  }
  if (mousePressed) {
    palo();
  }
  textSize(30);
  fill(color(255, 0, 0));
  text("rojas: "+controjas, 190, 30);

  textSize(30);
  fill(color(0, 0, 255));
  text("azules: "+contazul, 590, 30);

  if (N.ChocaCon(B)) {
    N.separar(B.pos, B.vel);
    B.separar(N.pos, N.vel);
  }

  for (int i=0; i<BOLAS.size(); i++) {
    bola estabola = BOLAS.get(i);
    estabola.mover();
    estabola.mostrar();
  }

  //1-14 bolas

  B.mover();
  stroke(255);
  N.mover();
  N.mostrar();


if (nuevo ==false)  B.mostrar();
  
  

  for (int x=0; x<NEGRAS.size(); x++) {
    bola esquina = NEGRAS.get(x);
    
    
    if (B.ChocaCon(esquina)) {//choque bola blanca con esquina
      B.vel.x=0;
      B.vel.y=0;
    nuevo=true;
      
      B.pos.x = width/2-200;
      B.pos.y= height/2;}
    if (N.ChocaCon(esquina)) {
      if (contazul < 7 && turno == 1) {          //choque bola negra con esquina
        tipodejuego=3; //ganador rojo                                               //turno 1 = azul turno 2 = rojo
      }
      if (controjas < 7 && turno == 2) {
        tipodejuego=2;
      }
      if (contazul == 7) {
        tipodejuego=2;
      }
      if (controjas == 7) {
        tipodejuego=3;
      }
      if (controjas == 7 && contazul == 7 && turno == 1) {
        tipodejuego=3;
      }
      if (controjas == 7 && contazul == 7 && turno == 2) {
        tipodejuego=2;
      }
    }
  }

loop:
  for (int i=0; i<BOLAS.size(); i++) {
    bola estabola = BOLAS.get(i);
    if ((estabola.vel.x != 0 || estabola.vel.y != 0) || (B.vel.y !=0 || B.vel.x !=0) || (N.vel.y != 0 || N.vel.x != 0)) { //si cualquier bola aún se está moviendo, no se puede jugar hasta que la velocidad x e y sean 0
      jugar = false;
      break loop;  //para que no siga iterando el i
    } else {
      jugar = true;
      if (turnoCambio) {
        if (turno == 1) {
          turnosAzules--;
          if (turnosAzules < 1) {
            turnosRojos++;
          }
        }
        if (turno == 2) {
          turnosRojos--;
          if (turnosRojos < 1) {
            turnosAzules++;
          }
        }
        if(nuevo){
        if(estabola.vel.x == 0 || estabola.vel.y == 0 || N.vel.y==0||N.vel.x==0){
          nuevo = false;
        }}
        turnoCambio = false;
      }
    }
  }



  if (isA) {
    isA = false;
    tipodejuego = 4;
    fill(color(255, 0, 0));
  }

  if (turnosAzules > 0) {
    turno = 1;
  }
  if (turnosRojos > 0) {
    turno = 2;
  }
  if (turnosAzules < 0) {
    turnosAzules = 0;
  }
  if (turnosRojos < 0) {
    turnosRojos = 0;
  }


  println(turnosAzules, turnosRojos);

  textSize(25);
  if (turno == 1) {
    text("Turno Jugador 1 - Azules", 100, 480);
  }
  if (turno == 2) {
    text("Turno Jugador 2 - Rojas", 100, 480);
  }
}
