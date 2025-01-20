import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/screens/scoreboard.dart';
import 'package:quiz_app/services/getter_repo.dart';

import '../main.dart';

class CommonScreenViewModel extends ChangeNotifier {
  // variables
  bool _isLoadingQuiz = true;
  late QuizModel _quizModel;
  late BuildContext context;
  late ButtonStyle _buttonStyle;

  // Question screen
  int _currentQuestionIndex = 0;
  int _totalScore = 0;
  int _selectedIndex = -1;
  int _correctAnswerCount = 0;
  int _totalQuestions = 0;

  // get to pass in the screen
  bool get isLoadingQuiz => _isLoadingQuiz;
  QuizModel get quizModel => _quizModel;
  ButtonStyle get buttonStyle => _buttonStyle;

  int get currentQuestionIndex => _currentQuestionIndex;
  int get totalScore => _totalScore;
  int get selectedIndex => _selectedIndex;
  int get correctAnswerCount => _correctAnswerCount;
  int get totalQuestions => _totalQuestions;

  // initialise method
  initialise(BuildContext context) {
    initController();
    getQuiz(context);
    context = context;
  }

  // init method to init the vairables
  void initController() {
    _buttonStyle = const ButtonStyle();
  }

  // get quiz from api call
  getQuiz(BuildContext context) async {
    Response response = await GetterRepo.getQuiz();

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      _isLoadingQuiz = false;
      _quizModel = quizModelFromJson(response.body);
      _totalQuestions = quizModel.questions!.length;
      notifyListeners();
    } else {
      logger.i("Something went wrong. Status Code: ${response.statusCode}");
    }
    _isLoadingQuiz = false;
    notifyListeners();
  }

  updateSelectionIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  void nextQuestion(
      bool isCorrect, BuildContext context, CommonScreenViewModel viewModel) {
    if (isCorrect) {
      _totalScore += 4;
      _correctAnswerCount++;
      logger.d(_correctAnswerCount);
      notifyListeners();
    } else {
      _totalScore -= 1;
      notifyListeners();
    }

    // delaying to show the answer is correct or wrong to the user and going to the next question
    Future.delayed(
      const Duration(milliseconds: 400),
      () {
        if (_currentQuestionIndex < _quizModel.questions!.length - 1) {
          _currentQuestionIndex++;
          _selectedIndex = -1;
          _buttonStyle = ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          );
          notifyListeners();
        } else {
          // Handle end of quiz
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ScoreboardScreen(viewModel: viewModel),
            ),
          );
        }
      },
    );
  }

  void previousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      notifyListeners();
    }
  }

  Future<bool> handleBackButtonPress(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit Quiz'),
        content: const Text('Are you sure you want to exit the quiz?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              context.pop();
            },
            child: const Text('Exit'),
          ),
        ],
      ),
    );
    return true;
  }
}
