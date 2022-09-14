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
      try {
        nextWeapon = _weaponList[_nextWeaponIndex];
        _nextWeaponIndex++;
      } on RangeError catch (e) {
        print(
            "Tableau max index : ${e.end! + 1} et demande : ${_nextWeaponIndex}");
      } catch (e) {}
    }
    return nextWeapon;
  }
}
