class QuestionModel2 {
  String? question2;
  String? answer2;
  String? imageUrl2;

  QuestionModel2({this.question2, this.answer2, this.imageUrl2});

  void setQuestion2(String getQuestion2) {
    question2 = getQuestion2;
  }

  void setAnswer2(String getAnswer2) {
    answer2 = getAnswwer2();
  }

  void setImageUrl2(String getImageUrl2) {
    imageUrl2 = getImageUrl2;
  }

  String? getQuestion2() {
    return question2;
  }

  String? getAnswwer2() {
    return answer2;
  }

  String? getImageUrl2() {
    return imageUrl2;
  }
}
