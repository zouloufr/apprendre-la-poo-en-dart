class Player {
  String userName = "";
  int strength = 1;
  int health = 100;
  int score = 0;

  void sayHi() {
    print("Hi, my name is ${this.userName} and my points are : ${this.score}");
    print("Level : $level");
  }

  int get level => (score / 100).truncate();
}
