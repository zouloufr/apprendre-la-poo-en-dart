import 'dart:io';

String readText(String question) {
  print(question);
  return stdin.readLineSync()!;
}

String readTextWithMin(String question, {int minSize = 3}) {
  String answer;
  do {
    answer = readText(question + " ($minSize caractères min.)");
  } while (answer.length < minSize);
  return answer;
}

int readInt(String question) {
  int? typedValue;
  do {
    typedValue = int.tryParse(readText(question));
    if (typedValue == null) {
      print("Veuillez saisir un nombre entier valide.");
    }
  } while (typedValue == null);
  return typedValue;
}

double readDouble(String question) {
  double? typedValue;
  do {
    typedValue = double.tryParse(readText(question));
    if (typedValue == null) {
      print("Veuillez saisir un nombre réel valide.");
    }
  } while (typedValue == null);
  return typedValue;
}

int selectFromMenu(String message, int max) {
  int userChoice;
  do {
    userChoice = readInt(message);
    if (userChoice < 1 || userChoice > max) {
      print("Veuillez choisir une valeur comprise entre 1 et $max");
    }
  } while (userChoice < 1 || userChoice > max);
  return userChoice;
}
