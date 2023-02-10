import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trivia_app/cubits/cubit/home_cubit.dart';

class Utils {
  static printDebug(data) {
    if (kDebugMode) {
      print(data);
    }
  }

  static int getCategory(String cat) {
    int category = 21;
    if (cat == "Mythology") {
      category = 20;
    } else if (cat == "Sports") {
      category = 21;
    } else if (cat == "Geography") {
      category = 22;
    } else if (cat == "History") {
      category = 23;
    } else if (cat == "Politics") {
      category = 24;
    } else if (cat == "Art") {
      category = 25;
    } else if (cat == "Celebrations") {
      category = 26;
    } else if (cat == "Animals") {
      category = 27;
    } else if (cat == "Vehicle") {
      category = 28;
    }

    return category;
  }

  static String getDifficulty(String diff) {
    String difficulty = "medium";
    if (diff == "Medium") {
      difficulty = "medium";
    } else if (diff == "Easy") {
      difficulty = "easy";
    } else if (diff == "Hard") {
      difficulty = "hard";
    }
    return difficulty;
  }

  static String getType(String diff) {
    String difficulty = "boolean";
    if (diff == "True/False") {
      difficulty = "boolean";
    } else if (diff == "Multiple") {
      difficulty = "multiple";
    }
    return difficulty;
  }

  loader() => const SizedBox(
        height: 15,
        width: 15,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      );
}
