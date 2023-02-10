import 'package:trivia_app/data/api_services/api_services.dart';
import 'package:trivia_app/data/models/question_model.dart';
import 'package:trivia_app/utils/dio_error_handler.dart';

import '../../utils/dio_response_handler.dart';

abstract class DataRepository {
  Future<QuestionsDataModel> fetchQuestions(url);
}

class Questions implements DataRepository {
  DioServices dioServices = DioServices();
  @override
  Future<QuestionsDataModel> fetchQuestions(url) async {
    ResponseHandler response = await dioServices.get(url);
    if (response.success) {
      return QuestionsDataModel.fromJson(response.data);
    } else {
      return QuestionsDataModel(responseCode: 1, results: []);
    }
  }
}
