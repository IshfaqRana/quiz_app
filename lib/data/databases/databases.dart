import 'package:hive/hive.dart';

class Databases {
  var box = Hive.box('myBox');
  Databases() {
    // ignore: unnecessary_null_comparison
    if (box == null) {
      box = Hive.box("myBox");
    } else {
      box;
    }
  }
}
