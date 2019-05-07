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
  float randX, randY;
  float dx, dy;
  float[] directions = new float[]{0.0, 0.5, 1.0, 1.5};
  int movementType;
  LivingRock(float x, float y) {
    super(x, y);
    movementType = /*1;*/(int)random(3);
    randX = random(width);
    randY = random(height);
    if (movementType == 0) {
      direction = random(2);
    } else if (movementType == 1) {
      direction = PVector.angleBetween(new PVector(x,y), new PVector(randX,randY))/(float)Math.PI;
    } else if (movementType == 2) {
      direction = directions[(int)random(4)];
    }
  }
  void display() {
    super.display();
    /*fill(0);
    ellipse(randX,randY,10,10);*/
  }
  void update() {
    dx = (float)(5*Math.cos(direction*Math.PI));
    dy = (float)(5*Math.sin(direction*Math.PI));
  }
  float[] generateDirections() {
    float[] copy = new float[3];
    int index = 0;
    for (float val : directions) {
      if (val!=direction) {
        copy[index]=val;
        index++;
      }
    }
    return copy;
  }
  void screensaver() {
    update();
    if (x+dx<0 || x+dx>width) {
      direction = 1-direction;
    } else if (y+dy<0 || y+dy>height) {
      direction = -direction;
    }
  }
  void randTarget() {
    update();
    if (dist(x,y,randX,randY)<1) {
      randX = random(width);
      randY = random(height);
      direction = (float)(Math.atan((randY-y)/(randX-x)));
    }
  }
  void randWalk() {
    if (random(10)<1) {
      direction = generateDirections()[(int)random(3)];
    }
    update();
    if (x+dx<0 || x+dx>width || y+dy<0 || y+dy>height) {
      direction = generateDirections()[(int)random(3)];
    }
  }
  void move() {
    if (movementType == 0) {
      screensaver();
    } else if (movementType == 1) {
      randTarget();
    } else if (movementType == 2) {
      randWalk();
    }
    update();
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
