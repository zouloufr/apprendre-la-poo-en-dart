// @dart=2.10
import 'dart:math';

import 'bot.dart';
import 'NE_PAS_TOUCHER/user_input.dart';

void main() {
  print("Bonjour!");
  final bot1 = Bot();
  final userName = readText("Quel est votre pseudo ?");
  int tourActuel = 1;
  
  do {
    readText("Appuyez sur Entrée pour lancer les dés !");
    final dicesValue = rollDices(userName);
    bot1.health -= dicesValue;
    print("$userName assène un coup sur le bot avec une force de $dicesValue");
    print("Bot - Santé ${bot1.health}%");
    print("Fin du tour $tourActuel\n");
    tourActuel++;
  } while (bot1.health > 0);
  print("Vous avez gagné la partie !");
}

int rollDices(String playerName){
  int randomNumber;
  final generator = Random();
  int min = 1;
  int max = 6;
  randomNumber = min + generator.nextInt(max - min) + min + generator.nextInt(max - min);
  
  print("$playerName lance les dés... et a obtenu $randomNumber");
  return randomNumber;
}
