// @dart=2.10
import 'NE_PAS_TOUCHER/user_input.dart';

void main() {
  List<int> scoresList = [];
  keyTab();
  print("Hi there!");
  sayHi();
  String myName = askName();
  for (var score in scoresList) {
    print(score);
  }
  bool exit = false;
  int choice = readInt("Please choose 1, 2 or 3:");
  do {
    switch (choice) {
      case 1:
        print("You choose 1");
        exit = true;
        break;
      case 2:
        print("You choose 2");
        exit = true;
        break;
      case 3:
        print("You choose 3");
        exit = true;
        break;
      default:
        print("Wrong choice please try again");
        choice = readInt("Please choose 1, 2 or 3:");
    }
  } while (exit == false);
  sayHi(userName: myName);
  int age = readInt("What is your age?");
  if (age >= 18) {
    print("You're an adult");
  } else {
    print("You're a kid");
  }
}

void sayHi({String userName = "Nobody"}) {
  print("Hi $userName :)");
}

String askName() {
  String userName;
  bool validUserName;
  do {
    userName = readText("Please choose a user name:");
    validUserName = (userName.length >= 3) && (userName.length <= 13);
  } while (validUserName == false);
  return userName;
}

void keyTab() {
  Map<String, int> scoreList = {"Truc": 120, "Machin": 140};
  scoreList.remove("Truc");
  scoreList["Truc"] = 99;
  scoreList["Truc"] = 126;
  scoreList["Bidule"] = 130;
  print(scoreList);

  for (final item in scoreList.entries) {
    final theKey = item.key;
    final theValue = item.value;
    print("$theKey : $theValue");
  }
}
