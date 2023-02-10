import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:trivia_app/cubits/cubit/home_cubit.dart';

import '../../../utils/text_styles.dart';

class AnsweredQuestions extends StatelessWidget {
  const AnsweredQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: Padding(
                padding: EdgeInsets.all(2.h),
                child: ListView.builder(
                  itemCount: state.saved.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 6.h,
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
                            state.saved[index].question ?? "",
                            style: AppTextStyles.regBlack12Bold,
                          ),
                        ),
                        Column(
                          children: [
                            RadioListTile(
                              title: Text(state.saved[index].correctAnswer ??
                                  "Correct Answer"),
                              value: state.saved[index].correctAnswer,
                              groupValue: state.saved[index].selectedAnswer,
                              onChanged: (value) {},
                            ),
                            RadioListTile(
                              title:
                                  Text(state.saved[index].incorrectAnswers![0]),
                              value: state.saved[index].incorrectAnswers![0],
                              groupValue: state.saved[index].selectedAnswer,
                              onChanged: (value) {},
                            ),
                            state.saved[index].incorrectAnswers!.length > 1
                                ? RadioListTile(
                                    title: Text(state
                                        .saved[index].incorrectAnswers![1]),
                                    value:
                                        state.saved[index].incorrectAnswers![1],
                                    groupValue:
                                        state.saved[index].selectedAnswer,
                                    onChanged: (value) {},
                                  )
                                : SizedBox(),
                            state.saved[index].incorrectAnswers!.length > 2
                                ? RadioListTile(
                                    title: Text(state
                                        .saved[index].incorrectAnswers![2]),
                                    value:
                                        state.saved[index].incorrectAnswers![2],
                                    groupValue:
                                        state.saved[index].selectedAnswer,
                                    onChanged: (value) {},
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ],
                    );
                  },
                )));
      },
    );
  }
}
