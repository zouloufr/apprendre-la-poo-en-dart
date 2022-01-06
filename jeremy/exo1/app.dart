// @dart=2.10
import 'dart:math';
import 'bot.dart';
import 'NE_PAS_TOUCHER/user_input.dart';
import 'player.dart';

void main() {
  print("Bonjour!");
  final bot1 = Bot();
  final currentPlayer = Player();
  currentPlayer.userName = readText("Quel est votre pseudo ?");
  int tourActuel = 1;
  
  do {
    int randomOrder;
    final generator = Random();
    randomOrder = generator.nextInt(2);
    if (randomOrder == 0) {
      readText("Appuyez sur Entrée pour lancer les dés !");
      attack(currentPlayer.userName, bot: bot1);
      playerData(bot: bot1);

      attack("Bot", player: currentPlayer);
      playerData(player: currentPlayer);  
    } else {
      attack("Bot", player: currentPlayer);
      playerData(player: currentPlayer);
      readText("Appuyez sur Entrée pour lancer les dés !");
      attack(currentPlayer.userName, bot: bot1);
      playerData(bot: bot1);
    }
 
    print("Fin du tour $tourActuel\n");
    tourActuel++;
  } while (bot1.health > 0 && currentPlayer.health > 0);
  if (bot1.health < 1 && currentPlayer.health > 0) {
    print("Bravo ! Vous avez gagné la partie !");
  } else {
    if (currentPlayer.health < 1 && bot1.health > 0) {
      print("Dommage ! Vous avez pardu la partie !");
    } else {
      print("Match nul !");
    }
  }
}
void attack(String playerName, {Bot bot, Player player}){
  final dicesValue = rollDices(playerName);
  if (bot != null) {
    bot.health -= dicesValue;
  }
  if (player != null) {
    player.health -= dicesValue;  
  }
  
  print("$playerName assène un coup sur ${player?.userName ?? "bot"} avec une force de $dicesValue");
}

void playerData({Bot bot, Player player}){
  if (player != null) {
    print("${player.userName} - Santé ${player.health}%\n");  
  }
  if (bot != null) {
    print("Bot - Santé ${bot.health}%\n");  
  }
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