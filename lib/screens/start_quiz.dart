import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/screens/common_vm.dart';
import 'package:quiz_app/utils/assets.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/devices/device_utility.dart';
import 'package:quiz_app/utils/routes.dart';
import 'package:stacked/stacked.dart';

class StartQuizScreen extends StatelessWidget {
  const StartQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CommonScreenViewModel>.reactive(
      viewModelBuilder: () => CommonScreenViewModel(),
      onViewModelReady: (viewModel) {
        AppDeviceUtility.setStatusBarColor(color: AppColors.statusBar);
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              "Start Quiz",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.primary,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated illustration of quiz
                Lottie.asset(
                  AppAssets.quizIllustrator,
                  width: 250.w,
                  height: 250.h,
                ),
                50.verticalSpace,
                // Rounded Button
                GestureDetector(
                  onTap: () {
                    context.push(AppRoutes.QUIZSCREENROUTE);
                  },
                  child: Container(
                    width: 300.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple.withOpacity(0.2),
                          blurRadius: 15.r,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Start Quiz",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
