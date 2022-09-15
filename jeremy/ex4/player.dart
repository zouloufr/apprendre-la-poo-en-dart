import 'NE_PAS_TOUCHER/user_input.dart';
import 'dart:math';
import 'bot.dart';
import 'fighter.dart';
import 'weapon.dart';
import 'weapon_list_manager.dart';

class Player extends Fighter {
  final String _nickname;
  int _score = 0;

  final WeaponListManager _weaponListManager = WeaponListManager();
  Weapon _weapon = Weapon("Pistolet", 1, 90);

  Player(this._nickname, {int strength = 1}) : super(strength, 100);

  String get nickname => _nickname;
  int get score => _score;

  void attackOrRest(Bot bot) {
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
      _attack(bot);
    }
  }

  void _attack(Bot bot) {
    final randomPercent = Random().nextInt(100) + 1;
    if (randomPercent <= _weapon.accuracy) {
      final dicesValue = rollDices(nickname);
      final hitStrength = dicesValue * (strength + _weapon.power);
      print(
          "$nickname frappe le bot avec l'arme ${_weapon.name} et une force de $hitStrength");
      bot.health = bot.health - hitStrength;
    } else {
      print("$nickname frappe le sol !");
    }
  }

  void didWin(Bot bot) {
    this.strength += bot.strength;
    final newWeapon = _weaponListManager.getNextWeaponToLoot();
    _score += 1;

    if (newWeapon != null) {
      final pickWeaponChoice = selectFromMenu(
          "Le bot a laisse tomber une arme (${newWeapon.description}), tapez 1 pour la ramasser ou 2 pour garder votre arme actuelle (${newWeapon.description})",
          2);
      if (pickWeaponChoice == 1) {
        _weapon = newWeapon;
      }
    }
    raiseHealth(0.9);
  }

  void raiseHealth(double factor) {
    final gain = this.health * factor;
    this.health = min(100, this.health + gain.toInt());
  }

  void newLife() {
    this.health = 100;
  }

  @override
  int rollDices(String who) {
    print("Bonne chance");
    return super.rollDices(who);
  }
}
