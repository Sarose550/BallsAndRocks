


class Ball extends Thing implements Moveable, Collideable {
  Ball(float x, float y) {
    
    super(x, y);
  }
  int col1 = int(random(255));
  int col2 = int(random(255));
  int col3 = int(random(255));
 
  
  int xspeed = int(random(60) - 30);
  int yspeed = int(random(60) - 30);
  void display() {
    
    /* ONE PERSON WRITE THIS */
    fill(col1, col2, col3) ; // color
    if(isTouching()){
      fill(255,0,0);
    }
    ellipse(x, y, 50, 50) ; // creation of ball

    fill(0, 126, 255) ;
    ellipse(x, y, 25, 25) ; // smaller ball inside sort of like decoration
    fill(0, 0, 0) ;
    rect(x, y, 5, 5) ;
    
  }
  
  boolean isTouching(){
    int i = 0;
    while(i < loc.size() /2){
      if(dist(x,y, loc.get(i * 2), loc.get((i * 2) + 1)) < 70){
        return(true);
      }
      i += 1;
    }
    return(false);
  }

  void move() {
    /* ONE PERSON WRITE THIS */
    x = x + xspeed;
    y = y + yspeed;
   // println(x,y,xspeed, yspeed);
    if (x < 0) {
      x = 0;
      xspeed = -xspeed;
      yspeed = (int(random(60)) - 30);
    }
    if (x > width) {
      x = 1000;
      xspeed = -xspeed;
      yspeed = (int(random(60)) - 30);
    }
    if (y < 0) {
      y = 0;
      yspeed = -yspeed;
      xspeed = (int(random(60)) - 30);
    }
    if (y > height) {
      y = 800;
      yspeed = -yspeed;
      xspeed = (int(random(60)) - 30);
    }
  }
}
