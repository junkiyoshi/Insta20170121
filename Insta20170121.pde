import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

ArrayList<Particle> particles;
Attractor attractor;

VerletPhysics2D physics;

void setup()
{
  size(512, 512);
  frameRate(30);
  background(255);
  colorMode(HSB);
  
  background(0);
  
  physics = new VerletPhysics2D();
  physics.setDrag(0.1);

  particles = new ArrayList<Particle>();
  for(int i = 0; i < 1024; i += 1)
  {
    particles.add(new Particle(new Vec2D(random(width), random(height))));
  }
  
  attractor = new Attractor(new Vec2D(width/ 2, height / 2));
  
  // noLoop();
}

void draw()
{  
  fill(0, 16);
  noStroke();
  rect(0, 0, width, height);
  
  physics.update();

  attractor.compute();
  attractor.disiplay();
  
  for(Particle p : particles)
  {
    p.display();
  }
  
  if(mousePressed)
  {
    attractor.lock();
    attractor.set(mouseX, mouseY);
    attractor.unlock();
  }
}

void mousePressed()
{
  loop();
}