import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/screens/common_vm.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/devices/device_utility.dart';
import 'package:quiz_app/utils/routes.dart';

// ignore: must_be_immutable
class ScoreboardScreen extends StatelessWidget {
  ScoreboardScreen({super.key, required this.viewModel});

  CommonScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    AppDeviceUtility.setStatusBarColor(color: AppColors.statusBar);
    final double screenWidth = MediaQuery.of(context).size.width;
    return BackButtonListener(
      onBackButtonPressed: () async {
        Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.INITIALROUTE, (Route<dynamic> route) => false);

        return false;
      },
      child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            title: const Text(
              "Scoreboard",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.primary,
          ),
          body: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.9,
                    padding: const EdgeInsets.all(6),
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: AppColors.bgCard1,
                      borderRadius: BorderRadius.circular(180),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Correct Answer ${viewModel.correctAnswerCount}/${viewModel.totalQuestions}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  30.verticalSpace,
                  // Score text
                  Text(
                    "Your Score: ${viewModel.totalScore}",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Congratulations text
                  const Text(
                    "Congratulations on your achievement!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Additional text
                  const Text(
                    "You've done a fantastic job and we're proud of you. Keep it up!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  50.verticalSpace,
                  // Explore more button
                  GestureDetector(
                    onTap: () {
                      context.push(AppRoutes.INITIALROUTE);
                    },
                    child: Container(
                      width: 300.w,
                      height: 34.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: AppColors.buttonExplore,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            spreadRadius: 2,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Explore More",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
