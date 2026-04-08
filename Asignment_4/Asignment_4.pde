// declaring the object coin
Coin coin;


void setup() {
  size(600, 400);
  // creating an instance to the coin sprite sheet
  coin = new Coin("Coin.png", 7, 64, 64, width/2 - 64, 130);
}


void draw() {
  background(40, 120, 200);
  //  methods to makeing the coin objet  to change the sprite sheet 
  coin.update();

  coin.display();


  textSize(30);
  text(coin.getResultMessage(), width/2, 330);
}
// pressing the space key to activate the coin spin
void keyPressed() {
  if (key == ' ') {
    coin.startFlip();
  }
}
