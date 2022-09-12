import 'dart:async';

import 'NE_PAS_TOUCHER/user_input.dart';

void main() {
  List<int> scoresList = [];
  closure();
  iTerateAllList();
  // testNullValues();
  // keyTab();
  // print("Hi there!");
  // sayHi();
//   String myName = askName();
//   for (var score in scoresList) {
//     print(score);
//   }
//   bool exit = false;
//   int choice = readInt("Please choose 1, 2 or 3:");
//   do {
//     switch (choice) {
//       case 1:
//         print("You choose 1");
//         exit = true;
//         break;
//       case 2:
//         print("You choose 2");
//         exit = true;
//         break;
//       case 3:
//         print("You choose 3");
//         exit = true;
//         break;
//       default:
//         print("Wrong choice please try again");
//         choice = readInt("Please choose 1, 2 or 3:");
//     }
//   } while (exit == false);
//   sayHi(userName: myName);
//   int age = readInt("What is your age?");
//   if (age >= 18) {
//     print("You're an adult");
//   } else {
//     print("You're a kid");
//   }
}

void sayHi({String? userName}) {
  print("Hi ${userName ?? "my great user"}");
  if (userName != null) {
    print("Hi $userName :) Your name has ${userName.length} chars.");
  }
}

String askName() {
  String userName;
  bool validUserName;
  do {
    userName = readText("Please choose a user name:")!;
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

void testNullValues() {
  bool isAnonymous = true;
  String? user;
  if (isAnonymous == false) {
    user = "Ted";
  } else {
    user = null;
  }
  sayHi(userName: user);
}

void typesConversion() {
  int note1 = 20;
  int note2 = (19.9).toInt();
  double note3 = note1.toDouble();
}

void closure() {
  print("Before");
  Timer(Duration(seconds: 3), () {
    print("Gogogo!");
  });
  print("Timer ready");
}

void iTerateAllList() {
  var gradeList = [14.5, 15.0, 7.5, 17.75, 19.0];
  gradeList = gradeList.where((grade) {
    if (grade > 10) {
      return true;
    } else {
      return false;
    }
  }).toList();

  var gradeListLetters = gradeList.map((grade) {
    String letter;
    if (grade > 15) {
      letter = "A";
    } else if (grade > 10) {
      letter = "B";
    } else {
      letter = "C";
    }
    return letter;
  }).toList();

  for (var item in gradeListLetters) {
    print(item);
  }
}
