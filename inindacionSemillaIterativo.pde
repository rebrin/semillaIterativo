import java.util.Stack;

Stack <PVector> pila=new Stack();
void setup(){

  size(800,600);
  background(255);
  beginShape();
    vertex(10,10);
    vertex(100,10);
    vertex(100,100);
    vertex(50,150);
    vertex(10,100);
  endShape(CLOSE);
}
void draw(){}

void rellena(int x, int y,color relleno, color fondo){
   PVector seed=new PVector(x,y);
   pila.push(seed);
   while(!pila.isEmpty()){
     
     PVector NSeed=pila.pop();
     println(NSeed.toString());
     //cambiar el pixel a color de relleno
     set(int(NSeed.x),int(NSeed.y),relleno);
     //comenzamos con conectividad 4
     //izquierda
     color pizq=get(int(NSeed.x-1),int(NSeed.y));
     if(pizq!=relleno && pizq==fondo){
       pila.push(new PVector(int(NSeed.x-1),int(NSeed.y)));
     }
     
     //derecha
     color pixel=get(int(NSeed.x+1),int(NSeed.y));
     if(pixel!=relleno && pixel==fondo){
       pila.push(new PVector(int(NSeed.x+1),int(NSeed.y)));
     }
     
      //arriba
     pixel=get(int(NSeed.x),int(NSeed.y-1));
     if(pixel!=relleno && pixel==fondo){
       pila.push(new PVector(int(NSeed.x),int(NSeed.y-1)));
     }
     
     //abajo
     pixel=get(int(NSeed.x),int(NSeed.y+1));
     if(pixel!=relleno && pixel==fondo){
       pila.push(new PVector(int(NSeed.x),int(NSeed.y+1)));
     }         
   }//fin del while
}

void mouseClicked(){
  rellena(mouseX,mouseY,color(255,0,0),color(255));
}
