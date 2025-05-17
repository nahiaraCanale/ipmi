// variables para dibujar/animar
float tamLetra = 5;
int posX = 0;
int posY = 0;
int tam = 500;

// vriables para las imágenes
PImage imagen1;
PImage imagen2;
PImage imagen3;
PImage imagen4;

String texto1 = "The last of us es un videojuego de acción \ny aventura desarrollado por Naughty dogs. \n Ambientado en un mundo postapocalíptico \ndevastado por una pandemia mundial \ncausada por un hongo mutado"; 
String texto2 = "El juego sigue la historia de Joel, un hombre endurecido por la pérdida, y Ellie, una adolescente con una misteriosa inmunidad.";
String texto3 = "Juntos emprenden un peligroso viaje a través de los Estados Unidos cuyo fin es poder encontrar una cura en base a la inmunidad de Ellie, enfrentándose tanto a humanos hostiles como a criaturas infectadas.";
String texto4 = "FIN";
String texto5 = "reiniciar";

// variables para el boton
int botonX = 530;
int botonY = 410;
int botonW = 100;
int botonH = 30;

// estado y tiempo
int e;
int contadorFrames = 0;

void setup() {
  size(640, 480);
  imagen1 = loadImage("tloula.jpg");
  imagen2 = loadImage("tloulala(1).jpg");
  imagen3 = loadImage("tlou2.jpg");
  imagen4 = loadImage("thelastofus.jpg");
  e = 1;
}

void draw() {
  background(222);
  println(mouseX + "/" + mouseY);
  contadorFrames++;  // Aumenta cada frame

  textAlign(LEFT, BASELINE); // alineación por defecto

  // 1er pantalla
  if (e == 1) {
    image(imagen2, 0, 0, width, height);
    textSize(tamLetra);
    fill(255);
    text(texto1, posX + 20, 75, 500, 500);
    if (tamLetra < 25) {
      tamLetra += 0.05;
    }

    if (contadorFrames == 60 * 8) {
      e = 2;
    }
  }

  // 2da pantalla
  else if (e == 2) {
    image(imagen1, 0, 0, width, height);
    textSize(25);
    fill(255);
    text(texto2, posX + 5, 75, tam, tam);
    posX++;
    if (posX + tam >= width) {
      posX = 0;
    }

    if (contadorFrames == 60 * 16) {
      e = 3;
    }
  }

  // 3era pantalla
  else if (e == 3) {
    image(imagen3, 0, 0, width, height);
    textSize(25);
    fill(255);
    text(texto3, posX + 5, posY + 5, tam, tam);
    posY++;
    if (posY + 5 >= height) {
      posY = 0;
    }

    if (contadorFrames == 60 * 28) {
      e = 4;
    }
  }

  // 4ta pantalla
  else if (e == 4) {
    image(imagen4, 0, 0, width, height);
    textSize(25);
    fill(255);
    textAlign(CENTER, CENTER);
    text(texto4, width / 2, height / 2);

    // mi boton 
    fill(200);
    rect(botonX, botonY, botonW, botonH, 10);
    fill(0);
    textSize(20);
    text(texto5, botonX + botonW / 2, botonY + botonH / 2);
  }
}

void mousePressed() {
  if (e == 4) {
    if (mouseX >= botonX && mouseX <= botonX + botonW &&
        mouseY >= botonY && mouseY <= botonY + botonH) {

      e = 1;
      tamLetra = 5;
      posX = 0;
      posY = 0;
      contadorFrames = 0; 
    }
  }
}


 
