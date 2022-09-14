import 'dart:math';

class Fighter {
  int _health;
  int _strength;
  Fighter(this._strength, this._health);
  int get strength => _strength;
  int get health => _health;
  bool get isAlive => health > 0;

  set strength(int strength) {
    _strength = max(0, strength);
  }

  set health(int health) {
    _health = max(0, health);
  }

  void display() {
    print("Bot - ${health}% - Force : ${strength}");
  }

  int rollDices(String who) {
    final generator = Random();
    final randomNumber = generator.nextInt(6) + 1 + generator.nextInt(6) + 1;
    print("$who a lancé les dés et a obtenu la valeur $randomNumber");
    return randomNumber;
  }
}
