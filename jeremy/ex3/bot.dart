import 'player.dart';

class Bot {
  int health;
  final int strength;

  Bot(this.strength, {this.health = 100});

  void display() {
    print("Bot - ${health}% - Force : ${strength}");
  }

  void attack(Player player) {
    final dicesValue = Player.rollDices("Bot");
    final hitStrength = dicesValue * strength;
    player.health -= hitStrength;
  }
}
