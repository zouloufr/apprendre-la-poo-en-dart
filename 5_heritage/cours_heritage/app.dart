import 'bot.dart';
import 'joueur.dart';

void main() {
  Joueur j1 = Joueur("Ian");
  print(j1.sante);
  j1.recevoirCoup(1);
  print(j1.sante);
}
