class Coin {
  // to make sure that image file appears in the run

  PImage img;
Coin(String Coin) {
img = loadImage(Coin);
  }
  
// display the coin at the X and Y value
  void display(float x, float y) {
    imageMode(CENTER);
    image(img, x, y);
  }
}
  
