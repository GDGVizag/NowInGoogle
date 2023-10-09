class Questionnaire {
  final List<Question> questions;
  const Questionnaire({
    required this.questions,
  });
}

class Question<P> {
  final QuestionType type;
  final String question;
  final List<P> options;
  final String hint;
  const Question({
    required this.type,
    required this.question,
    this.options = const [],
    this.hint = "",
  });
}

enum QuestionType {
  shortAnswer,
  longAnswer,
  mcq,
  checkbox,
  fileUpload,
  rating,
  date,
  radio,
  dropdown,
}
