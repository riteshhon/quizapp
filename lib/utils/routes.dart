// ignore_for_file: constant_identifier_names

import 'package:go_router/go_router.dart';
import 'package:quiz_app/screens/questions.dart';
import 'package:quiz_app/screens/start_quiz.dart';

class AppRoutes {
  AppRoutes._();

  static const String INITIALROUTE = "/";
  static const String QUIZSCREENROUTE = "/quizscreen";

  static final GoRouter router = GoRouter(
    initialLocation: INITIALROUTE,
    routes: [
      GoRoute(
        path: INITIALROUTE,
        builder: (context, state) => const StartQuizScreen(),
      ),
      GoRoute(
        path: QUIZSCREENROUTE,
        builder: (context, state) => const QuizScreen(),
      ),
    ],
  );
}
