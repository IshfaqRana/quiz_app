// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names
part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  error,
}

enum Difficulty { AnyDifficulty, EASY, MEDIUM, HARD }

enum Type { AnyType, MULTIPLE, BOOLEAN }

class HomeState extends Equatable {
  final QuestionsDataModel questionsDataModel;
  final List<SavedResult> saved;
  final List<SavedResult> results;
  final HomeStatus status;
  final String category;
  final String difficulty;
  final String type;
  final List<String> categoryList;
  final List<String> difficultyList;
  final List<String> typeList;
  final int question;
  final int lives;

  const HomeState({
    required this.questionsDataModel,
    required this.status,
    required this.results,
    required this.category,
    required this.categoryList,
    required this.difficulty,
    required this.difficultyList,
    required this.type,
    required this.typeList,
    required this.question,
    required this.lives,
    required this.saved,
  });

  factory HomeState.initial() {
    return HomeState(
      questionsDataModel: QuestionsDataModel(),
      status: HomeStatus.initial,
      category: "Any Category",
      categoryList: const [
        "Any Category",
        "Sports",
        "Geography",
        "History",
        "Politics",
        "Art",
        "Celebrations",
        "Animals",
        "Vehicle",
        "Mythology"
      ],
      difficulty: "AnyDifficulty",
      difficultyList: const ["AnyDifficulty", "Easy", "Medium", "Hard"],
      type: "AnyType",
      typeList: const ["AnyType", "True/False", "Multiple"],
      question: 0,
      lives: 3,
      saved: [],
      results: [],
    );
  }
  @override
  List<Object?> get props => [
        questionsDataModel,
        status,
        category,
        saved,
        categoryList,
        difficulty,
        difficultyList,
        type,
        results,
        typeList,
        question,
        lives,
      ];

  @override
  bool get stringify => true;

  HomeState copyWith({
    QuestionsDataModel? questionsDataModel,
    List<SavedResult>? saved,
    List<SavedResult>? results,
    HomeStatus? status,
    String? category,
    String? difficulty,
    String? type,
    List<String>? categoryList,
    List<String>? difficultyList,
    List<String>? typeList,
    int? question,
    int? lives,
  }) {
    return HomeState(
      questionsDataModel: questionsDataModel ?? this.questionsDataModel,
      status: status ?? this.status,
      saved: saved ?? this.saved,
      results: results ?? this.results,
      category: category ?? this.category,
      difficulty: difficulty ?? this.difficulty,
      type: type ?? this.type,
      categoryList: categoryList ?? this.categoryList,
      difficultyList: difficultyList ?? this.difficultyList,
      typeList: typeList ?? this.typeList,
      question: question ?? this.question,
      lives: lives ?? this.lives,
    );
  }
}
