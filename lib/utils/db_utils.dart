import 'package:trivia_app/data/databases/databases.dart';

import '../data/models/saved_question_data_model.dart';

class DBUtils {
  Databases db = Databases();
  insertValues(value) {
    var box = db.box;
    box.put("question", value);
  }

  List<SavedResult> getValues() {
    var box = db.box;
    List<SavedResult> saved = box.get("question");
    return saved;
  }
}
