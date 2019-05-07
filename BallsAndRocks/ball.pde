int xspeed = 0;
int yspeed = 0;
int col1 = int(random(255));
int col2 = int(random(255));
int col3 = int(random(255));




class Ball extends Thing implements Moveable {
  Ball(float x, float y) {

    super(x, y);
  }

  void display() {
    /* ONE PERSON WRITE THIS */
    fill(col1, col2, col3) ; // color
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
