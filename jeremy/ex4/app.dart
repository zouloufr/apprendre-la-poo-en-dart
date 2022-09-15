import 'dart:math';

import 'NE_PAS_TOUCHER/user_input.dart';
import 'bot.dart';
import 'player.dart';
import 'player_manager.dart';

void main() {
  final PlayerManager _playerManager = PlayerManager();
  var player = Player(readTextWithMin("Entrez votre pseudo :"), strength: 1);
  _playerManager.createPlayer(player);
  bool gameContinues = true;
  do {
    var actionCount = 0;
    int botCount = 0;

    while (_playerManager.getCurrentPlayer().isAlive) {
      final b1 =
          Bot(strength: max(1, _playerManager.getCurrentPlayer().strength - 1));
      print("Un bot se présente à vous et veut se battre...\n");
      var isItPlayerTurn = Random().nextBool();
      do {
        if (isItPlayerTurn) {
          _playerManager.getCurrentPlayer().attackOrRest(b1);
        } else {
          b1.attack(_playerManager.getCurrentPlayer());
        }

        _playerManager
            .getCurrentPlayer()
            .display(_playerManager.getCurrentPlayer().nickname);
        b1.display("Bot");
        actionCount++;
        print("Fin du tour $actionCount\n");
        isItPlayerTurn = !isItPlayerTurn;
      } while (b1.health > 0 && _playerManager.getCurrentPlayer().isAlive);

      if (_playerManager.getCurrentPlayer().isAlive) {
        print(
            "${_playerManager.getCurrentPlayer().nickname} a vaincu le bot !");
        _playerManager.getCurrentPlayer().didWin(b1);
        botCount++;
      }
    }

    print('''
        __________________________________________________
        ${_playerManager.getCurrentPlayer().nickname} a vaincu $botCount bot(s) avant d'être terrassé par le bot !
        Score total de ${_playerManager.getCurrentPlayer().nickname} : ${_playerManager.getCurrentPlayer().score}
        __________________________________________________
        ''');

    int userChoice = 1;
    userChoice = selectFromMenu('''
      Partie terminée. Voulez-vous :
      1- Faire une nouvelle partie
      2- Quitter et revenir plus tard''', 2);
    if (userChoice == 2) {
      print("Bye bye !");
      gameContinues = false;
    } else {
      String newPlayerNickname =
          readTextWithMin("Saisissez le nom du prochain joueur :");
      if (_playerManager.playerIndex(newPlayerNickname) == -1) {
        _playerManager.createPlayer(Player(newPlayerNickname, strength: 1));
        print("Bienvenue $newPlayerNickname, bonne partie !");
      } else {
        _playerManager.setCurrentPlayer(newPlayerNickname);
        _playerManager.getCurrentPlayer().newLife();
        print('''
        __________________________________________________
        Content de vous voir de nouveau !
        Votre score actuel : ${_playerManager.getCurrentPlayer().score}, bravo !
        __________________________________________________''');
      }
    }
  } while (gameContinues);
}
