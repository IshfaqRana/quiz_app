import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:trivia_app/cubits/cubit/home_cubit.dart';
import 'package:trivia_app/data/models/saved_question_data_model.dart';
import 'package:trivia_app/presentation/screens/answered_questions/answered_question.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/text_styles.dart';
import '../../widgets/custom_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String? choices;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              backgroundColor: AppColors.kBGWhite,
              body: state.lives <= 0
                  ? Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            "Done",
                            style: AppTextStyles.lightBlue14,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomButton(
                            color: AppColors.lightBlue,
                            text: "Restart",
                            height: 5.4.h,
                            width: 50.w,
                            loading: context.read<HomeCubit>().state.status ==
                                HomeStatus.loading,
                            onPressed: () async {
                              await context.read<HomeCubit>().fetchQuestions();
                              context.read<HomeCubit>().emitReset();
                            },
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomButton(
                            color: AppColors.lightBlue,
                            text: "View Answered Questions",
                            height: 5.4.h,
                            width: 50.w,
                            loading: context.read<HomeCubit>().state.status ==
                                HomeStatus.loading,
                            onPressed: () async {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AnsweredQuestions(),
                                  ),
                                  (route) => false);
                              await context
                                  .read<HomeCubit>()
                                  .getSavedQuestions();
                            },
                          )
                        ],
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.all(2.h),
                      child: SingleChildScrollView(
                          child: Column(children: [
                        SizedBox(
                          height: 6.h,
                        ),
                        SizedBox(
                          height: 3.h,
                          width: 90.0.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Lives:",
                                style: AppTextStyles.regBlack12Bold,
                              ),
                              Text(
                                state.lives.toString(),
                                style: AppTextStyles.regBlack12Bold,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        SizedBox(
                          height: 3.h,
                          width: 90.0.w,
                          child: Text(
                            "Question:",
                            style: AppTextStyles.regBlack12Bold,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        SizedBox(
                          height: 6.h,
                          width: 90.0.w,
                          child: Text(
                            state.questionsDataModel.results![state.question]
                                    .question ??
                                "",
                            style: AppTextStyles.regBlack12Bold,
                          ),
                        ),
                        Column(
                          children: [
                            RadioListTile(
                              title: Text(state.questionsDataModel
                                      .results![state.question].correctAnswer ??
                                  "Correct Answer"),
                              value: state.questionsDataModel
                                  .results![state.question].correctAnswer,
                              groupValue: choices,
                              onChanged: (value) {
                                setState(() {
                                  choices = value.toString();
                                });
                              },
                            ),
                            RadioListTile(
                              title: Text(state
                                  .questionsDataModel
                                  .results![state.question]
                                  .incorrectAnswers![0]),
                              value: state
                                  .questionsDataModel
                                  .results![state.question]
                                  .incorrectAnswers![0],
                              groupValue: choices,
                              onChanged: (value) {
                                setState(() {
                                  choices = value.toString();
                                });
                              },
                            ),
                            state.questionsDataModel.results![state.question]
                                        .incorrectAnswers!.length >
                                    1
                                ? RadioListTile(
                                    title: Text(state
                                        .questionsDataModel
                                        .results![state.question]
                                        .incorrectAnswers![1]),
                                    value: state
                                        .questionsDataModel
                                        .results![state.question]
                                        .incorrectAnswers![1],
                                    groupValue: choices,
                                    onChanged: (value) {
                                      setState(() {
                                        choices = value.toString();
                                      });
                                    },
                                  )
                                : SizedBox(),
                            state.questionsDataModel.results![state.question]
                                        .incorrectAnswers!.length >
                                    2
                                ? RadioListTile(
                                    title: Text(state
                                        .questionsDataModel
                                        .results![state.question]
                                        .incorrectAnswers![2]),
                                    value: state
                                        .questionsDataModel
                                        .results![state.question]
                                        .incorrectAnswers![2],
                                    groupValue: choices,
                                    onChanged: (value) {
                                      setState(() {
                                        choices = value.toString();
                                      });
                                    },
                                  )
                                : SizedBox(),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomButton(
                          color: AppColors.lightBlue,
                          text: "Next",
                          height: 5.4.h,
                          width: 90.w,
                          loading: context.read<HomeCubit>().state.status ==
                              HomeStatus.loading,
                          onPressed: () async {
                            if (choices !=
                                state.questionsDataModel
                                    .results![state.question].correctAnswer) {
                              context.read<HomeCubit>().emitLives();
                            }
                            FocusScope.of(context).requestFocus(FocusNode());
                            SavedResult result = SavedResult(
                              category: state.questionsDataModel
                                  .results![state.question].category,
                              type: state.questionsDataModel
                                  .results![state.question].type
                                  .toString(),
                              difficulty: state.questionsDataModel
                                  .results![state.question].difficulty
                                  .toString(),
                              question: state.questionsDataModel
                                  .results![state.question].question,
                              correctAnswer: state.questionsDataModel
                                  .results![state.question].correctAnswer,
                              incorrectAnswers: state.questionsDataModel
                                  .results![state.question].incorrectAnswers,
                              selectedAnswer: choices,
                            );

                            context.read<HomeCubit>().emitQuestion();
                            context.read<HomeCubit>().emitResults(result);
                          },
                        )
                      ]))));
        });
  }
}
