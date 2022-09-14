import 'dart:math';

import 'player.dart';

class Bot {
  int _health;
  int _strength;
  Bot(this._strength, this._health);
  int get strength => _strength;
  int get health => _health;

  set strength(int strength) {
    _strength = max(0, strength);
  }

  set health(int health) {
    _health = max(0, health);
  }

  void display() {
    print("Bot - ${health}% - Force : ${strength}");
  }

  void attack(Player player) {
    final dicesValue = Player.rollDices("Bot");
    final hitStrength = dicesValue * strength;
    player.health -= hitStrength;
  }
}
