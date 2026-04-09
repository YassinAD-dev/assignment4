class Coin {

  PImage sheet;
  PImage[] frames;

  int frameCount;
  int frameW, frameH;

  int currentFrame = 0;

  PVector pos;        // manging the position
  PVector vel;        //  manging the velocity
  PVector centerPos;  //  knwoing the original position

  float displayW = 128;
  float displayH = 128;

  boolean flipping = false;
  int flipTimer = 0;

  String resultMessage = "";

  int state = 0; // 0 neutral, 1 = win, -1=  lose ensuring the win and lose conditions

  Coin(String filename, int frameCount, int frameW, int frameH, float x, float y) {

    this.frameCount = frameCount;
    this.frameW = frameW;
    this.frameH = frameH;

    pos = new PVector(x, y);
    centerPos = new PVector(x, y);

    vel = new PVector(0, 0);

    sheet = loadImage(filename);
    frames = new PImage[frameCount];

    for (int i = 0; i < frameCount; i++) {
      frames[i] = sheet.get(i * frameW, 0, frameW, frameH);
    }
  }

  void update() {

    // movement of the coin while spinning
    pos.add(vel);

    // friction to slow down the movement
    vel.mult(0.95);

    // animation flip
    if (flipping) {
      flipTimer++;

      // random little movement while flipping
      vel.x += random(-0.3, 0.3);
      vel.y += random(-0.3, 0.3);

      if (flipTimer % 5 == 0) {
        currentFrame++;

        if (currentFrame >= frameCount) {
          currentFrame = 0;
        }
      }

      if (flipTimer > 60) {
        flipping = false;
        decideResult();
      }
    } 
    else {
      // when not flipping, go back slowly to center
      pos.lerp(centerPos, 0.05);
    }
  }

  void display() {
    imageMode(CENTER);
    image(frames[currentFrame], pos.x, pos.y, displayW, displayH);
    imageMode(CORNER);
  }

  void startFlip() {
    if (flipping) return;

    flipping = true;
    flipTimer = 0;
    resultMessage = "";
    state = 0;

    // start with a small random push
    vel = new PVector(random(-2, 2), random(-2, 2));
  }

  void decideResult() {
    int r = (int)random(2);

    if (r == 0) {
      resultMessage = "HEAD - YOU WIN!";
      currentFrame = 0;
      state = 1;
    } else {
      resultMessage = "TAIL - YOU LOSE!";
      currentFrame = 4;
      state = -1;
    }
  }

  String getResultMessage() {
    return resultMessage;
  }

  int getState() {
    return state;
  }
}
