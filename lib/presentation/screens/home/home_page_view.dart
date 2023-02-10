import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:trivia_app/cubits/cubit/home_cubit.dart';
import 'package:trivia_app/presentation/screens/quiz/quiz_screen.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/text_styles.dart';
import '../../../utils/utils.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              backgroundColor: AppColors.kBGWhite,
              body: Padding(
                  padding: EdgeInsets.all(2.h),
                  child: SingleChildScrollView(
                      child: Column(children: [
                    SizedBox(
                      height: 26.h,
                    ),
                    SizedBox(
                      height: 3.h,
                      width: 90.0.w,
                      child: Text(
                        "Category",
                        style: AppTextStyles.regBlack10Bold,
                      ),
                    ),
                    SizedBox(
                      height: 0.3.h,
                    ),
                    CustomContainer(
                        height: 5.4.h,
                        width: 100.w,
                        child: SizedBox(
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                icon: Padding(
                                  padding: EdgeInsets.only(right: 3.0.w),
                                  child: Visibility(
                                    visible: true,
                                    child: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: AppColors.kBlack,
                                    ),
                                  ),
                                ),
                                hint: Padding(
                                  padding: EdgeInsets.only(left: 3.0.w),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Any Category',
                                          style: AppTextStyles.regGrey8,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                items: state.categoryList
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 3.0.w),
                                            child: Text(
                                              item,
                                              style: AppTextStyles.regGrey8,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                value: state.category,
                                onChanged: (String? value) {
                                  context
                                      .read<HomeCubit>()
                                      .changeCategoryValue(value);
                                },
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 3.h,
                      width: 90.0.w,
                      child: Text(
                        "Difficulty Level",
                        style: AppTextStyles.regBlack10Bold,
                      ),
                    ),
                    SizedBox(
                      height: 0.3.h,
                    ),
                    CustomContainer(
                        height: 5.4.h,
                        width: 100.w,
                        child: SizedBox(
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                  isExpanded: true,
                                  icon: Padding(
                                    padding: EdgeInsets.only(right: 3.0.w),
                                    child: Visibility(
                                      visible: true,
                                      child: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: AppColors.kBlack,
                                      ),
                                    ),
                                  ),
                                  hint: Padding(
                                    padding: EdgeInsets.only(left: 3.0.w),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Any Difficulty',
                                            style: AppTextStyles.regGrey8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  items: state.difficultyList
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 3.0.w),
                                              child: Text(
                                                item,
                                                style: AppTextStyles.regGrey8,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  value: state.difficulty,
                                  onChanged: (String? value) {
                                    context
                                        .read<HomeCubit>()
                                        .changeDifficultyValue(value);
                                  }),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 3.h,
                      width: 90.0.w,
                      child: Text(
                        "Any Type",
                        style: AppTextStyles.regBlack10Bold,
                      ),
                    ),
                    SizedBox(
                      height: 0.3.h,
                    ),
                    CustomContainer(
                        height: 5.4.h,
                        width: 100.w,
                        child: SizedBox(
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                icon: Padding(
                                  padding: EdgeInsets.only(right: 3.0.w),
                                  child: Visibility(
                                    visible: true,
                                    child: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: AppColors.kBlack,
                                    ),
                                  ),
                                ),
                                hint: Padding(
                                  padding: EdgeInsets.only(left: 3.0.w),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Any Type',
                                          style: AppTextStyles.regGrey8,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                items: state.typeList
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 3.0.w),
                                            child: Text(
                                              item,
                                              style: AppTextStyles.regGrey8,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                value: state.type,
                                onChanged: (String? value) {
                                  context
                                      .read<HomeCubit>()
                                      .changeTypeValue(value);
                                },
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    BlocConsumer<HomeCubit, HomeState>(
                        listener: ((context, state) {
                      if (state.status == HomeStatus.success) {
                        // Utils.showNormalToasts(
                        //     "Successfully fetched Questions");
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuizScreen(),
                            ),
                            (route) => false);
                      }
                    }), builder: (context, state) {
                      return CustomButton(
                        color: AppColors.lightBlue,
                        text: "Get Questions",
                        height: 5.4.h,
                        width: 90.w,
                        loading: context.read<HomeCubit>().state.status ==
                            HomeStatus.loading,
                        onPressed: () async {
                          FocusScope.of(context).requestFocus(FocusNode());

                          await context.read<HomeCubit>().fetchQuestions();
                        },
                      );
                    }),
                  ]))));
        });
  }
}
