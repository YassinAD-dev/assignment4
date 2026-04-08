class Coin {
// declaring the pimage object 
  PImage sheet;
  // declaring an array of Pimage object
  PImage[] frames;
// the amount frame timer for the sprite
  int frameCount;
  int frameW, frameH;

  int currentFrame = 0;
// posioning the images
  float x, y;
  float displayW = 128;
  float displayH = 128;
// to indecate to see if the animation is going or not
  boolean flipping = false;
  int flipTimer = 0;

  String resultMessage = "";
// its the constructor to create the coin object
  Coin(String filename, int frameCount, int frameW, int frameH, float x, float y) {

    this.frameCount = frameCount;
    this.frameW = frameW;
    this.frameH = frameH;
    this.x = x;
    this.y = y;
// creating the object 'sheet" " (Pimage
    sheet = loadImage(filename);
//  creating an aray with frame count size
    frames = new PImage[frameCount];

  // storing the images of size of frameW and frameH  in the array
    for (int i = 0; i < frameCount; i++) {
      frames[i] = sheet.get(i * frameW, 0, frameW, frameH);
    }
  }
  
// chaning thr sheet every 5 frames per second 
  void update() {
    if (flipping) {
      flipTimer++;

      
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
  }
// displaying the right sheet at the current frame
  void display() {
    image(frames[currentFrame], x, y, displayW, displayH);
  }
//  everytime you press space bar you clear the reasults, making the boolean = true ( starts the animation )
  void startFlip() {
    flipping = true;
    flipTimer = 0;
    resultMessage = "";
  }
// it picks randomly 1 or 0 , if its 0 it shows win condition, if its 1 it shows the lose condition
  void decideResult() {
    int r = (int)random(2);

    if (r == 0) {
      resultMessage = "HEAD - YOU WIN!";
      currentFrame = 0;
    } else {
      resultMessage = "TAIL - YOU LOSE!";
      currentFrame = 4;
    }
  }

  String getResultMessage() {
    return resultMessage;
  }
}
