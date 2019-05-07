interface Displayable {
  void display();
}

interface Moveable {
  void move();
}

abstract class Thing implements Displayable {
  float x, y;//Position of the Thing

  Thing(float x, float y) {
    this.x = x;
    this.y = y;
  }
  abstract void display();
}

class Rock extends Thing {
  Rock(float x, float y) {
    super(x, y);
  }

  void display() {
    /* ONE PERSON WRITE THIS */
    fill(160, 160, 160);

    ellipse(x, y, 53, 40);

    noStroke();
  }
}

public class LivingRock extends Rock implements Moveable {
  float direction;
  LivingRock(float x, float y) {
    super(x, y);
    direction = random(2);
  }
  void move() {
    float dx = (float)(5*Math.cos(direction*Math.PI));
    float dy = (float)(5*Math.sin(direction*Math.PI));
    if (x+dx<0 || x+dx>width) {
      direction = 1-direction;
    } else if (y+dy<0 || y+dy>height) {
      direction = -direction;
    }
    dx = (float)(5*Math.cos(direction*Math.PI));
    dy = (float)(5*Math.sin(direction*Math.PI));
    x+=dx;
    y+=dy;
    display();
  }
}

class Ball extends Thing implements Moveable {
  Ball(float x, float y) {

    super(x, y);
  }

  void display() {
    /* ONE PERSON WRITE THIS */
    fill(255, 255, 255) ; // color
    ellipse(x, y, 50, 50) ; // creation of ball
    fill(0, 126, 255) ;
    ellipse(x, y, 25, 25) ; // smaller ball inside sort of like decoration
    fill(0, 0, 0) ;
    rect(x, y, 5, 5) ;
  }

  void move() {
    /* ONE PERSON WRITE THIS */
    x = random(10) + x - 5;
    y = random(10) + y - 5;
    if (x < 0) {
      x = 0;
    }
    if (x > 1000) {
      x = 1000;
    }
    if (y < 0) {
      y = 0;
    }
    if (y > 800) {
      y = 800;
    }
  }
}


/*DO NOT EDIT THE REST OF THIS */

ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;

void setup() {
  size(1000, 800);

  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  for (int i = 0; i < 10; i++) {
    Ball b = new Ball(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(b);
    thingsToMove.add(b);
    Rock r = new Rock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(r);
  }
  for (int i = 0; i < 3; i++) {
    LivingRock m = new LivingRock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(m);
    thingsToMove.add(m);
  }
}
void draw() {
  //background(255);
  background(51);

  for (Displayable thing : thingsToDisplay) {
    thing.display();
  }
  for (Moveable thing : thingsToMove) {
    thing.move();
  }
}
