// A rectangular box
class Bomba {
  //  Instead of any of the usual variables, we will store a reference to a Box2D Body
  Body body;      
  float w,h;
 color r;
  color g;
   color b;
  Bomba(float x, float y, color r_, color g_, color b_) {
    w = 16;
    h = 16;
    r=r_;
    g=g_;
    b=b_;
    //c_=c;
    // Build Body
    BodyDef bd = new BodyDef();      
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);

 body.setLinearVelocity(new Vec2(random(-20,20),random(30,60)));

   // Define a polygon (this is what we use for a rectangle)
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);  // Box2D considers the width and height of a
    sd.setAsBox(box2dW, box2dH);            // rectangle to be the distance from the
                           // center to the edge (so half of what we
                          // normally think of as width or height.) 
    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.1;

    // Attach Fixture to Body               
    body.createFixture(fd);
  }
   void killBody() {
    box2d.destroyBody(body);
  }
 boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height-random(0,20)) {
      killBody();
      return true;
    }
    return false;
  }
  void display() {
    // We need the Body’s location and angle
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();

    pushMatrix();
    translate(pos.x,pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);              // translate and rotate the rectangle
    fill(r,g,b);
    noStroke();
    rectMode(CENTER);
    ellipse(0,0,random(0,6),random(0,6));
    popMatrix();
  }

  
  
}