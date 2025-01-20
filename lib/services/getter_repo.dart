import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/services/payload.dart';

class GetterRepo with ChangeNotifier {
  static Logger logger = Logger();

  static Future<Response> getQuiz() async {
    try {
      Response response = await http.get(Uri.parse(APIPayload.BASEURL));
      logger.i("Quiz response: ${response.body}");
      return response;
    } catch (e) {
      logger.e("Failed to get quiz. Error: ${e.toString()}");
      rethrow;
    }
  }
}
