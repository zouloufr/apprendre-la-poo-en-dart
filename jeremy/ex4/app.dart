import 'dart:math';

import 'NE_PAS_TOUCHER/user_input.dart';
import 'bot.dart';
import 'player.dart';

void main() {
  final player = Player(readText("Entrez votre pseudo :"), strength: 1);
  var actionCount = 0;
  var botCount = 0;

  while (player.isAlive) {
    final b1 = Bot(strength: max(1, player.strength - 1));
    print("Un bot se présente à vous et veut se battre...\n");
    var isItPlayerTurn = Random().nextBool();
    do {
      if (isItPlayerTurn) {
        player.attackOrRest(b1);
      } else {
        b1.attack(player);
      }

      player.display();
      b1.display();
      actionCount++;
      print("Fin du tour $actionCount\n");
      isItPlayerTurn = !isItPlayerTurn;
    } while (b1.health > 0 && player.isAlive);

    if (player.isAlive) {
      print("${player.nickname} a vaincu le bot !");
      player.didWin(b1);
      botCount++;
    }
  }

  print(
      "${player.nickname} a vaincu $botCount bot(s) avant d'être terrassé par le bot !");
}
