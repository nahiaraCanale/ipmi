//https://youtu.be/zCySGhXY1UE
PImage grilla;
int columnas = 8;
int filas = 14;
float anchoCelda, altoCelda;
float desplazamiento = 0;
color colorA;
color colorB;

void setup() {
  size(800, 400);
  grilla = loadImage("grilladegrade.jpg");
  anchoCelda = (width / 2.0) / columnas;
  altoCelda = height / float(filas);
  noStroke();
  colorA = color(255);
  colorB = color(0);
}

void draw() {
  background(255);
  image(grilla, 0, 0, width / 2, height);
  translate (400,0); 
  for (int col = 0; col < columnas; col++) {
   
    for (int fila = 0; fila < filas; fila++) {
      float x = 0 + col * anchoCelda; 
      float y = fila * altoCelda;
      dibujarCelda(x, y, anchoCelda, altoCelda, fila, col, desplazamiento);
  
  }
 }
}

void dibujarCelda(float x, float y, float ancho, float alto, int fila, int col, float desplazamiento) {  
  for (float lineaX = 0; lineaX < ancho; lineaX++) {
    float desplazadoX = lineaX + desplazamiento;
    fill(colorDegradado(desplazadoX, ancho, fila, col));
    rect(x + lineaX, y, 1, alto); 
 }
}
color colorDegradado(float desplazadoX, float anchoCelda, int fila, int columna) {
  float amt = map(desplazadoX % anchoCelda, 0, anchoCelda, 0, 1); 
  color c = lerpColor(colorA, colorB, amt);
  if (fila % 2 == 0) { 
    return c;
  } else {
    return lerpColor(colorB, colorA, amt);  
 }
}

void mouseMoved() {
  desplazamiento = map(mouseX, 0, width, 0, anchoCelda);
}

void keyPressed() {
  if (key == 'r') {
    desplazamiento = 0;
    colorA = color(255);
    colorB = color(0);
 } else if (key == 'v' ) {
    colorA = color(200, 100, 255);  
    colorB = color(80, 0, 120);        
 } else if (key == 'a') {
    colorA = color(255, 255, 180);  
    colorB = color(120, 120, 0);       
 }
}     
