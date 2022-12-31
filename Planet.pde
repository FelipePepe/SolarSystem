class Planet {
  float radius;
  float angle;
  float distance;

  float orbitspeed;
  Planet[] planets;



  Planet(float r, float d, float o) {
    radius = r;
    angle = random(TWO_PI);
    distance = d;
    orbitspeed = o;
  }

  void show() {
    pushMatrix();
    fill(255, 100);
    rotate(angle);
    translate(distance, 0);

    ellipse(0f, 0f, radius * 2, radius * 2);
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    popMatrix();
  }

  void spanMoons(int total, int level) {
    planets = new Planet[total];
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        float r = radius * 0.5;
        float d = random(75, 300);
        float o = random(0.001, 0.03);
        planets[i] = new Planet(r, d, o);
        if (level < 1) {
          int numMoon = int(random(0, 4));
          planets[i].spanMoons(numMoon, level + 1);
        }
      }
    }
  }

  void orbit() {
    angle = angle + orbitspeed;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }
}
