import 'NE_PAS_TOUCHER/user_input.dart';
import 'dart:math';
import 'bot.dart';
import 'weapon.dart';
import 'weapon_list_manager.dart';

class Player {
  final String _nickname;
  int _strength;
  int _health;
  final WeaponListManager _weaponListManager = WeaponListManager();
  Weapon _weapon = Weapon("Pistolet", 1, 90);

  Player(this._nickname, this._health, this._strength);

  String get nickname => _nickname;
  int get strength => _strength;
  int get health => _health;
  bool get isAlive => health > 0;

  set strength(int strength) {
    _strength = max(0, strength);
  }

  set health(int health) {
    _health = max(0, health);
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
      final dicesValue = Player.rollDices(nickname);
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
}
