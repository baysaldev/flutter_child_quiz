class QuestionModel {
  String? question;
  String? answer;
  String? imageUrl;

  QuestionModel({this.question, this.answer, this.imageUrl});

  void setQuestion(String getQuestion) {
    question = getQuestion;
  }

  void setAnswer(String getAnswer) {
    answer = getAnswwer();
  }

  void setImageUrl(String getImageUrl) {
    imageUrl = getImageUrl;
  }

  String? getQuestion() {
    return question;
  }

  String? getAnswwer() {
    return answer;
  }

  String? getImageUrl() {
    return imageUrl;
  }
}
