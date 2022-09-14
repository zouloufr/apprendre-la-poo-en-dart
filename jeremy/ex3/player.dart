import 'NE_PAS_TOUCHER/user_input.dart';
import 'dart:math';
import 'bot.dart';

class Player {
  late String nickname;
  late int strength;
  late int health;
  bool get isAlive => health > 0;

  Player(this.nickname, {this.health = 100, this.strength = 1});
  Player.anonymous() {
    Player("Unknown");
  }

  static int rollDices(String who) {
    final generator = Random();
    final randomNumber = generator.nextInt(6) + 1 + generator.nextInt(6) + 1;
    print("$who a lancé les dés et a obtenu la valeur $randomNumber");
    return randomNumber;
  }

  void display() {
    print("$nickname - ${health}% - Force : ${strength}");
  }

  void attack(Bot bot) {
    int userChoice = 1;
    if (this.health < 40) {
      userChoice = selectFromMenu(
          '''${this.nickname}, - ${this.health}%, quelle action souhaitez-vous faire ?
      1- Attaquer le bot
      2- Vous reposer pour récupérer de la santé''', 2);
    }
    if (userChoice == 2) {
      raiseHealth(0.75);
    } else {
      readText("Appuyez sur entrée pour lancer les dés et attaquer le bot");
      final dicesValue = Player.rollDices(nickname);
      final hitStrength = dicesValue * strength;
      bot.health = bot.health - hitStrength;
    }
  }

  void didWin(Bot bot) {
    this.strength += bot.strength;
    raiseHealth(0.9);
  }

  void raiseHealth(double factor) {
    final gain = this.health * factor;
    this.health = min(100, this.health + gain.toInt());
  }
}
