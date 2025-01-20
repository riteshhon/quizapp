import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/web.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/devices/device_utility.dart';
import 'package:quiz_app/utils/routes.dart';

Logger logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppDeviceUtility.setStatusBarColor(color: AppColors.primary);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: AppRoutes.router.routerDelegate,
        routeInformationParser: AppRoutes.router.routeInformationParser,
        routeInformationProvider: AppRoutes.router.routeInformationProvider,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        builder: (context, child) {
          return child!;
        },
      ),
    );
  }
}
