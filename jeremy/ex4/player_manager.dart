import 'player.dart';

class PlayerManager {
  final List<Player> _playerList = [];
  int _currentPlayer = 0;

  bool playerExists(String nickname) {
    if (_playerList.where((element) => element.nickname == nickname).isEmpty) {
      return false;
    }
    return true;
  }

  int createPlayer(Player newPlayer) {
    _playerList.add(newPlayer);
    _currentPlayer = _playerList.indexOf(newPlayer);
    return _currentPlayer;
  }
}
