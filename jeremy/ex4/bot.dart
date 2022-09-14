// import 'dart:math';

import 'fighter.dart';
import 'player.dart';

class Bot extends Fighter {
  Bot({int strength = 1}) : super(strength, 100);

  void attack(Player player) {
    final dicesValue = rollDices("Bot");
    final hitStrength = dicesValue * strength;
    player.health -= hitStrength;
  }
}
