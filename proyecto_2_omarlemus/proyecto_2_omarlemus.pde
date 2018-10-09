

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import processing.video.*;

Movie video;
Box2DProcessing box2d;


ArrayList<Boundary> boundaries;
//Bomba bomb;
ArrayList<Bomba> bomb;

ArrayList<ParticleSystem> systems;
PImage imagen;
void setup() {
  size(800,600);
  video= new Movie(this, "power.mp4");
  video.loop();
  smooth();
 imagen = loadImage("ultra1.png");
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -30);


  // Create ArrayLists  
  systems = new ArrayList<ParticleSystem>();
  boundaries = new ArrayList<Boundary>();
  bomb = new ArrayList<Bomba>();


  boundaries.remove(new Boundary(370,419,600,1,0));
    boundaries.remove(new Boundary(376,410,600,1,0));

}
void movieEvent(Movie video){
  video.read();
}
void draw() {
  background(0);

  image(video,395,320,500,150);
  fill(0);
  noStroke();
 rect (500,240,150,30);
  imageMode(CENTER);
  image(imagen,width/2,height/2,1480/2,800/2);
chispas();
  box2d.step();
  if ((key=='f')&& keyPressed==true) {
    Bomba a = new Bomba(680,155,255,0,0);
     Bomba a1= new Bomba(680,185,199,5,31);
     Bomba a2= new Bomba(115,155,199,5,31);
       Bomba a3= new Bomba(115,185,199,5,31);
    bomb.add(a);
      bomb.add(a1);
      bomb.add(a2);
      bomb.add(a3);
  }

  // Display all the boxes
  for (Bomba b: bomb) {
    b.display();
  }

  for (ParticleSystem system: systems) {
    system.run();

    int n = (int) random(0,2);
    system.addParticles(n);
  }


  for (Boundary wall: boundaries) {
    wall.display();
  }
  fill(255);
  text("( c f)- Para chispas",100,80);
  text("( f )- Para confeti",100,70);
}


void chispas() {
  // Add a new Particle System whenever the mouse is clicked
  if ( (keyPressed==true)&&key=='c'){
  systems.add(new ParticleSystem(0, new PVector(500,205)));
   systems.add(new ParticleSystem(0, new PVector(600,205)));
   systems.add(new ParticleSystem(0, new PVector(550,205)));
     systems.add(new ParticleSystem(0, new PVector(280,205)));
   systems.add(new ParticleSystem(0, new PVector(230,205)));
   systems.add(new ParticleSystem(0, new PVector(180,205)));
 keyPressed=false;
  }
}