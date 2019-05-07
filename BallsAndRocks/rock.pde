class RockSpot{
  FloatList holder = new FloatList();
  
  void append(FloatList incom){
   
    for(float i: incom){
      holder.append(i);
    }
  }
  
  int size(){
    return(int(holder.size() / 2));
  }
  
  FloatList get(int index){
    FloatList temp = new FloatList();
    temp.append(holder.get(index * 2));
    temp.append(holder.get((index * 2) + 1));
    return(temp);
  }
  
  
}

RockSpot Loc = new RockSpot();

class Rock extends Thing {
  PImage image;
 
  Rock(float x, float y) {
   
    super(x, y);
    FloatList holder = new FloatList();
    holder.append(x);
    holder.append(y);
   
    Loc.append(holder);
  }
  
  Rock(float x, float y, String file) {
    super(x, y);
    image = loadImage(file);
    image.resize(int(x/10),int(y/10));
  }
  void display() {
    /* ONE PERSON WRITE THIS */
    fill(160, 160, 160);
    image(image,x,y);
    
    noStroke();
  }
  
}
  
public class LivingRock extends Rock implements Moveable {
  float direction;
  float randX, randY;
  float dx, dy;
  float[] directions = new float[]{0.0, 0.5, 1.0, 1.5};
  int movementType;
  LivingRock(float x, float y, String file) {
    super(x, y, file);
    movementType = /*1;*/(int)random(3);
    randX = random(width);
    randY = random(height);
    if (movementType == 0) {
      direction = random(2);
    } else if (movementType == 1) {
      dx = (randX-x)/30;
      dy = (randY-y)/30;
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
    if (dist(x,y,randX,randY)<1) {
      randX = random(width);
      randY = random(height);
      dx = (randX-x)/30;
      dy = (randY-y)/30;
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
    update();
  }
  void move() {
    if (movementType == 0) {
      screensaver();
    } else if (movementType == 1) {
      randTarget();
    } else if (movementType == 2) {
      randWalk();
    }
    x+=dx;
    y+=dy;
    display();
  }
}
