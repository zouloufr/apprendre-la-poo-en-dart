// @dart=2.10
import 'NE_PAS_TOUCHER/user_input.dart';

void main() {
  print("Bonjour!");
  sayHi();
  String myName = askName();

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
  int age = readInt("Quel est votre âge ?");
  if (age >= 18) {
    print("Vous êtes majeur");
  } else {
    print("Vous êtes mineur");
  }
}

void sayHi({String userName = "Nobody"}) {
  print("Bonjour $userName");
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
