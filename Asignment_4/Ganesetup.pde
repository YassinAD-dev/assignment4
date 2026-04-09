class Game {
// declaring the objet
  Coin coin;

  Game() {
    coin = new Coin("Coin.png", 7, 64, 64, width/2 - 64, 130);
  }

  void update() {
    coin.update();
  }

  void display() {

    // background depends on result
    if (coin.getState() == 1) {
      background(0, 200, 0); // win
    }
    else if (coin.getState() == -1) {
      background(200, 0, 0); // lose
    }
    else {
      background(40, 120, 200);
    }

    coin.display();



    textSize(30);
    text(coin.getResultMessage(), width/2, 330);
  }

  void flipCoin() {
    coin.startFlip();
  }
}
