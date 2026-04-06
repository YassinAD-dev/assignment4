//assigment 4

// declaring the objects

Coin coin;

// the background color and window size
void setup() {
  size(600, 400);
      background(37, 31, 61);
    
    ellipse(400, 190 , 300 , 300);
    fill(68, 11, 171);
    
    // creating the object for the coin spritesheet
  coin = new Coin("Coin.png");
}
// refreshing in deafult for the animation (still woking on manging the sprite to do animation)
void draw() {
  background(50);
  coin.display(width/2, height/2);
}
