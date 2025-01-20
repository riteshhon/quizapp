// To parse this JSON data, do
//
//     final quizModel = quizModelFromJson(jsonString);

import 'dart:convert';

QuizModel quizModelFromJson(String str) => QuizModel.fromJson(json.decode(str));

String quizModelToJson(QuizModel data) => json.encode(data.toJson());

class QuizModel {
  int? id;
  dynamic name;
  String? title;
  String? description;
  dynamic difficultyLevel;
  String? topic;
  DateTime? time;
  bool? isPublished;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? duration;
  DateTime? endTime;
  String? negativeMarks;
  String? correctAnswerMarks;
  bool? shuffle;
  bool? showAnswers;
  bool? lockSolutions;
  bool? isForm;
  bool? showMasteryOption;
  dynamic readingMaterial;
  dynamic quizType;
  bool? isCustom;
  dynamic bannerId;
  dynamic examId;
  bool? showUnanswered;
  DateTime? endsAt;
  dynamic lives;
  String? liveCount;
  int? coinCount;
  int? questionsCount;
  String? dailyDate;
  int? maxMistakeCount;
  List<dynamic>? readingMaterials;
  List<Question>? questions;
  int? progress;

  QuizModel({
    this.id,
    this.name,
    this.title,
    this.description,
    this.difficultyLevel,
    this.topic,
    this.time,
    this.isPublished,
    this.createdAt,
    this.updatedAt,
    this.duration,
    this.endTime,
    this.negativeMarks,
    this.correctAnswerMarks,
    this.shuffle,
    this.showAnswers,
    this.lockSolutions,
    this.isForm,
    this.showMasteryOption,
    this.readingMaterial,
    this.quizType,
    this.isCustom,
    this.bannerId,
    this.examId,
    this.showUnanswered,
    this.endsAt,
    this.lives,
    this.liveCount,
    this.coinCount,
    this.questionsCount,
    this.dailyDate,
    this.maxMistakeCount,
    this.readingMaterials,
    this.questions,
    this.progress,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        id: json["id"],
        name: json["name"],
        title: json["title"],
        description: json["description"],
        difficultyLevel: json["difficulty_level"],
        topic: json["topic"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        isPublished: json["is_published"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        duration: json["duration"],
        endTime:
            json["end_time"] == null ? null : DateTime.parse(json["end_time"]),
        negativeMarks: json["negative_marks"],
        correctAnswerMarks: json["correct_answer_marks"],
        shuffle: json["shuffle"],
        showAnswers: json["show_answers"],
        lockSolutions: json["lock_solutions"],
        isForm: json["is_form"],
        showMasteryOption: json["show_mastery_option"],
        readingMaterial: json["reading_material"],
        quizType: json["quiz_type"],
        isCustom: json["is_custom"],
        bannerId: json["banner_id"],
        examId: json["exam_id"],
        showUnanswered: json["show_unanswered"],
        endsAt:
            json["ends_at"] == null ? null : DateTime.parse(json["ends_at"]),
        lives: json["lives"],
        liveCount: json["live_count"],
        coinCount: json["coin_count"],
        questionsCount: json["questions_count"],
        dailyDate: json["daily_date"],
        maxMistakeCount: json["max_mistake_count"],
        readingMaterials: json["reading_materials"] == null
            ? []
            : List<dynamic>.from(json["reading_materials"]!.map((x) => x)),
        questions: json["questions"] == null
            ? []
            : List<Question>.from(
                json["questions"]!.map((x) => Question.fromJson(x))),
        progress: json["progress"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "title": title,
        "description": description,
        "difficulty_level": difficultyLevel,
        "topic": topic,
        "time": time?.toIso8601String(),
        "is_published": isPublished,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "duration": duration,
        "end_time": endTime?.toIso8601String(),
        "negative_marks": negativeMarks,
        "correct_answer_marks": correctAnswerMarks,
        "shuffle": shuffle,
        "show_answers": showAnswers,
        "lock_solutions": lockSolutions,
        "is_form": isForm,
        "show_mastery_option": showMasteryOption,
        "reading_material": readingMaterial,
        "quiz_type": quizType,
        "is_custom": isCustom,
        "banner_id": bannerId,
        "exam_id": examId,
        "show_unanswered": showUnanswered,
        "ends_at":
            "${endsAt!.year.toString().padLeft(4, '0')}-${endsAt!.month.toString().padLeft(2, '0')}-${endsAt!.day.toString().padLeft(2, '0')}",
        "lives": lives,
        "live_count": liveCount,
        "coin_count": coinCount,
        "questions_count": questionsCount,
        "daily_date": dailyDate,
        "max_mistake_count": maxMistakeCount,
        "reading_materials": readingMaterials == null
            ? []
            : List<dynamic>.from(readingMaterials!.map((x) => x)),
        "questions": questions == null
            ? []
            : List<dynamic>.from(questions!.map((x) => x.toJson())),
        "progress": progress,
      };
}

class Question {
  int? id;
  String? description;
  dynamic difficultyLevel;
  String? topic;
  bool? isPublished;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? detailedSolution;
  String? type;
  bool? isMandatory;
  bool? showInFeed;
  String? pyqLabel;
  int? topicId;
  int? readingMaterialId;
  DateTime? fixedAt;
  String? fixSummary;
  dynamic createdBy;
  String? updatedBy;
  dynamic quizLevel;
  String? questionFrom;
  dynamic language;
  dynamic photoUrl;
  dynamic photoSolutionUrl;
  bool? isSaved;
  String? tag;
  List<Option>? options;
  ReadingMaterial? readingMaterial;

  Question({
    this.id,
    this.description,
    this.difficultyLevel,
    this.topic,
    this.isPublished,
    this.createdAt,
    this.updatedAt,
    this.detailedSolution,
    this.type,
    this.isMandatory,
    this.showInFeed,
    this.pyqLabel,
    this.topicId,
    this.readingMaterialId,
    this.fixedAt,
    this.fixSummary,
    this.createdBy,
    this.updatedBy,
    this.quizLevel,
    this.questionFrom,
    this.language,
    this.photoUrl,
    this.photoSolutionUrl,
    this.isSaved,
    this.tag,
    this.options,
    this.readingMaterial,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        description: json["description"],
        difficultyLevel: json["difficulty_level"],
        topic: json["topic"],
        isPublished: json["is_published"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        detailedSolution: json["detailed_solution"],
        type: json["type"],
        isMandatory: json["is_mandatory"],
        showInFeed: json["show_in_feed"],
        pyqLabel: json["pyq_label"],
        topicId: json["topic_id"],
        readingMaterialId: json["reading_material_id"],
        fixedAt:
            json["fixed_at"] == null ? null : DateTime.parse(json["fixed_at"]),
        fixSummary: json["fix_summary"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        quizLevel: json["quiz_level"],
        questionFrom: json["question_from"],
        language: json["language"],
        photoUrl: json["photo_url"],
        photoSolutionUrl: json["photo_solution_url"],
        isSaved: json["is_saved"],
        tag: json["tag"],
        options: json["options"] == null
            ? []
            : List<Option>.from(
                json["options"]!.map((x) => Option.fromJson(x))),
        readingMaterial: json["reading_material"] == null
            ? null
            : ReadingMaterial.fromJson(json["reading_material"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "difficulty_level": difficultyLevel,
        "topic": topic,
        "is_published": isPublished,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "detailed_solution": detailedSolution,
        "type": type,
        "is_mandatory": isMandatory,
        "show_in_feed": showInFeed,
        "pyq_label": pyqLabel,
        "topic_id": topicId,
        "reading_material_id": readingMaterialId,
        "fixed_at": fixedAt?.toIso8601String(),
        "fix_summary": fixSummary,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "quiz_level": quizLevel,
        "question_from": questionFrom,
        "language": language,
        "photo_url": photoUrl,
        "photo_solution_url": photoSolutionUrl,
        "is_saved": isSaved,
        "tag": tag,
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
        "reading_material": readingMaterial?.toJson(),
      };
}

class Option {
  int? id;
  String? description;
  int? questionId;
  bool? isCorrect;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? unanswered;
  dynamic photoUrl;

  Option({
    this.id,
    this.description,
    this.questionId,
    this.isCorrect,
    this.createdAt,
    this.updatedAt,
    this.unanswered,
    this.photoUrl,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        description: json["description"],
        questionId: json["question_id"],
        isCorrect: json["is_correct"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        unanswered: json["unanswered"],
        photoUrl: json["photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "question_id": questionId,
        "is_correct": isCorrect,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "unanswered": unanswered,
        "photo_url": photoUrl,
      };
}

class ReadingMaterial {
  int? id;
  String? keywords;
  dynamic content;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<String>? contentSections;
  PracticeMaterial? practiceMaterial;

  ReadingMaterial({
    this.id,
    this.keywords,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.contentSections,
    this.practiceMaterial,
  });

  factory ReadingMaterial.fromJson(Map<String, dynamic> json) =>
      ReadingMaterial(
        id: json["id"],
        keywords: json["keywords"],
        content: json["content"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        contentSections: json["content_sections"] == null
            ? []
            : List<String>.from(json["content_sections"]!.map((x) => x)),
        practiceMaterial: json["practice_material"] == null
            ? null
            : PracticeMaterial.fromJson(json["practice_material"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "keywords": keywords,
        "content": content,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "content_sections": contentSections == null
            ? []
            : List<dynamic>.from(contentSections!.map((x) => x)),
        "practice_material": practiceMaterial?.toJson(),
      };
}

class PracticeMaterial {
  List<String>? content;
  List<String>? keywords;

  PracticeMaterial({
    this.content,
    this.keywords,
  });

  factory PracticeMaterial.fromJson(Map<String, dynamic> json) =>
      PracticeMaterial(
        content: json["content"] == null
            ? []
            : List<String>.from(json["content"]!.map((x) => x)),
        keywords: json["keywords"] == null
            ? []
            : List<String>.from(json["keywords"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "content":
            content == null ? [] : List<dynamic>.from(content!.map((x) => x)),
        "keywords":
            keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
      };
}
