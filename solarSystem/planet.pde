class Planet {
  float radius;
  float angle;
  float distance;
  Planet [] planets;
  float orbitSpeed;
  PVector v;
  PShape globe;

  
  Planet(float r, float d, float o, PImage img) {
    v = PVector.random3D(); //make unit vector of length 1 from planet
    radius = r;
    distance = d;
    v.mult(distance); //scale unit vector
    //random based on 2pi radians.
    angle = random(TWO_PI);
    orbitSpeed = o;
    //Can make random Pshapes
    noStroke();
    noFill();
    globe = createShape(SPHERE, radius);
    globe.setTexture(img);
  }
  
  void orbit() {
    angle = angle + orbitSpeed;
    if (planets != null) {
    for (int i = 0; i < planets.length; i++) {
      planets[i].orbit();
  }
    }
  }
    
  
   void spawnMoons(int total, int level) {
    planets = new Planet[total];
    
    for (int i = 0; i < planets.length; i++) {
        float r = radius/(level + 0.6);
        float d = random(radius + r, (radius + r)*3);
        float o = random(-0.02, 0.02);
        int index = int(random(0, textures.length));
        planets[i] = new Planet(r, d, o, textures[index]);
        if (level < 4) {
          int num = int(random(0, 4));
        planets[i].spawnMoons(num, level+1);
        }
    }
    }

  
    void show() {
      //always put at beginning. becomes its own world. any translations and 
      //rotations tha thappen in here don't happen anywhere else.
      pushMatrix();
      noStroke();
      fill(200, 220, 255);
      PVector v2 = new PVector(1, 0, 1); //arbitrary vector
      PVector p = v.cross(v2); //cross product to create perpendicular vector
      rotate(angle, p.x, p.y, p.z);
      translate(v.x, v.y, v.z);
      shape(globe);
      //sphere(radius);
    //ellipse(0, 0, radius * 2, radius * 2);
    
    if(planets != null) {
      
     for (int i = 0; i < planets.length; i++) {
       planets[i].show();
     }
    }
    popMatrix();
  }
}