import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:trivia_app/data/data_repository/data_repository.dart';
import 'package:trivia_app/data/models/question_model.dart';
import 'package:trivia_app/utils/db_utils.dart';

import '../../data/models/saved_question_data_model.dart';
import '../../utils/utils.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  fetchQuestions() async {
    emit(state.copyWith(status: HomeStatus.loading));
    Questions questions = Questions();
    String url = "api.php?amount=100";
    if (state.category == "Any Category") {
      url = url;
    } else {
      url = "$url&category=${Utils.getCategory(state.category)}";
    }
    if (state.difficulty == "AnyDifficulty") {
      url = url;
    } else {
      url = "$url&difficulty=${Utils.getDifficulty(state.difficulty)}";
    }
    if (state.type == "AnyType") {
      url = url;
    } else {
      url = "$url&type=${Utils.getType(state.type)}";
    }
    QuestionsDataModel questionsDataModel = await questions.fetchQuestions(url);
    if (questionsDataModel.responseCode == 1) {
      emit(state.copyWith(status: HomeStatus.error));
      // Utils.showNormalToasts("Error in fetching Data");
    } else {
      emit(state.copyWith(
          status: HomeStatus.success, questionsDataModel: questionsDataModel));
    }
  }

  changeCategoryValue(value) {
    emit(state.copyWith(category: value));
  }

  changeDifficultyValue(value) {
    emit(state.copyWith(difficulty: value));
  }

  changeTypeValue(value) {
    emit(state.copyWith(type: value));
  }

  emitQuestion() {
    emit(state.copyWith(question: state.question + 1));
  }

  emitReset() {
    emit(state.copyWith(
      lives: 3,
      question: 0,
      results: [],
    ));
  }

  emitLives() {
    emit(state.copyWith(lives: state.lives - 1, question: 0));
    if (state.lives <= 0) {
      getSavedQuestions();
    }
  }

  emitResults(SavedResult res) {
    List<SavedResult> result = state.results;
    result.add(res);
    emit(state.copyWith(results: result));
  }

  emitSaveResultToDB() {
    DBUtils().insertValues(state.results);
  }

  getSavedQuestions() {
    emit(state.copyWith(saved: state.results));
  }
}
