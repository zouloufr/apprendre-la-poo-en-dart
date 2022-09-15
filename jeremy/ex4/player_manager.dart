import 'player.dart';

class PlayerManager {
  final List<Player> _playerList = [];
  int _currentPlayer = 0;

  int playerIndex(String nickname) {
    return _playerList.indexWhere((element) => element.nickname == nickname);
  }

  int createPlayer(Player newPlayer) {
    _playerList.add(newPlayer);
    _currentPlayer = _playerList.indexOf(newPlayer);
    return _currentPlayer;
  }

  Player getCurrentPlayer() {
    return _playerList[_currentPlayer];
  }

  Player setCurrentPlayer(String nickname) {
    _currentPlayer = playerIndex(nickname);
    return getCurrentPlayer();
  }
}
