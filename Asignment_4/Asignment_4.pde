// (cotatopm) I did get help with my tutor in the sense of practicing with the code and then I would try and implment it on my own take, he did also provide a tiny bit of debugging when I tried a lot of things but they didn't work well, other than that I did a lot ony my own with the correct balance of guidance and self testing.
 
 
 Game game;

void setup() {
  size(600, 400);
  game = new Game();
}

void draw() {
  game.update();
  game.display();
}

void keyPressed() {
  if (key == ' ') {
    game.flipCoin();
  }
}
