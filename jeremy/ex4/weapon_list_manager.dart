import 'weapon.dart';

class WeaponListManager {
  final _weaponList = const [
    Weapon("Fusil", 2, 75),
    Weapon("Bazooka", 5, 50),
    Weapon("Lance-Flamme", 10, 75),
    Weapon("Grenade", 25, 50)
  ];

  int _nextWeaponIndex = 0;

  Weapon? getNextWeaponToLoot() {
    Weapon? nextWeapon;
    if (_nextWeaponIndex < _weaponList.length) {
      nextWeapon = _weaponList[_nextWeaponIndex];
      _nextWeaponIndex++;
    }
    return nextWeapon;
  }
}
