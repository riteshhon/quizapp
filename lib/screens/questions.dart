import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/screens/common_vm.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/devices/device_utility.dart';
import 'package:stacked/stacked.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CommonScreenViewModel>.reactive(
      viewModelBuilder: () => CommonScreenViewModel(),
      onViewModelReady: (viewModel) {
        AppDeviceUtility.setStatusBarColor(color: AppColors.primary);
        viewModel.getQuiz(context);
      },
      builder: (context, viewModel, child) {
        bool isSelected;
        return BackButtonListener(
          onBackButtonPressed: () async {
            if (viewModel.currentQuestionIndex > 0) {
              // Calling the previous question
              viewModel.previousQuestion();
            } else {
              // Calling the exit dialog here
              return viewModel.handleBackButtonPress(context);
            }
            return true;
          },
          child: Scaffold(
            backgroundColor: AppColors.primary,
            body: viewModel.isLoadingQuiz
                ? Center(
                    child: SizedBox(
                      height: 30.h,
                      width: 30.h,
                      child: CircularProgressIndicator(
                        color: AppColors.white,
                        strokeWidth: 3.w,
                      ),
                    ),
                  )
                : SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Circular Back Button
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: GestureDetector(
                              onTap: () async {
                                isSelected = false;
                                viewModel.currentQuestionIndex != 0
                                    ? viewModel.previousQuestion()
                                    : viewModel.handleBackButtonPress(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  color: AppColors.bgLight,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 24.h,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              // Question display
                              Text(
                                "Q${viewModel.currentQuestionIndex + 1} Question",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const Spacer(),
                              // Question display
                              Text(
                                "${viewModel.currentQuestionIndex + 1} of ",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.whiteLightText,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                viewModel.quizModel.questionsCount.toString(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.whiteLightText,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          // Horizontal circular indicator
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              viewModel.quizModel.questions!.length,
                              (index) => Container(
                                width: 28.w,
                                height: 6.h,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: index == viewModel.currentQuestionIndex
                                      ? AppColors.white
                                      : AppColors.bgLight,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          // Question display
                          Text(
                            viewModel
                                .quizModel
                                .questions![viewModel.currentQuestionIndex]
                                .description
                                .toString(),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteText,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 30.h),
                          // Options Grid
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 20,
                                childAspectRatio: 2.8,
                              ),
                              itemCount: viewModel
                                  .quizModel
                                  .questions![viewModel.currentQuestionIndex]
                                  .options!
                                  .length,
                              itemBuilder: (context, index) {
                                final option = viewModel
                                    .quizModel
                                    .questions![viewModel.currentQuestionIndex]
                                    .options![index];

                                // Check if this index is selected
                                isSelected = viewModel.selectedIndex == index;

                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isSelected
                                        ? option.isCorrect!
                                            ? AppColors.correctAnswer
                                            : AppColors.wrongAnswer
                                        : AppColors.white,
                                  ),
                                  onPressed: () {
                                    viewModel.updateSelectionIndex(index);
                                    // Check if the answer is correct and load the next question
                                    bool isCorrect = option.isCorrect!;
                                    viewModel.nextQuestion(
                                        isCorrect, context, viewModel);
                                  },
                                  child: Text(
                                    option.description.toString(),
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.text,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
