class Particle extends VerletParticle2D
{
  float r;
  
  Particle(Vec2D loc)
  {
    super(loc);
    r = 2;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, r * 4, -1));
  }
  
  void display()
  {   
    float a = atan2(y - attractor.y, x - attractor.x);
    float d = degrees(a);
    d = 255.0 / 360.0 * (d + 180.0);
    println(d);
    color c = color(d, 255, 255);    
        
    fill(c);
    noStroke();
    ellipse(x, y, r *2, r *2);
  }
}