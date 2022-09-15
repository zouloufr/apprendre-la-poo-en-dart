class Weapon implements Comparable<Weapon> {
  final String name;
  final int power;
  final int accuracy;

  const Weapon(this.name, this.power, this.accuracy);

  String get description =>
      "$name - Puissance : $power - Précision : $accuracy%";

  @override
  int compareTo(Weapon other) {
    return this.power.compareTo(other.power);
  }
}
