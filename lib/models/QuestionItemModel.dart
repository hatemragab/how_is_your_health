class QuestionItemModel {
  int id;
  String _imageUserProfile;
  String _userName;
  String _imageDoctorProfile;
  String _doctorName;
  String _date;
  String _question;
  String _answer;
  int _likes;

  QuestionItemModel(
      this.id,
      this._imageUserProfile,
      this._userName,
      this._imageDoctorProfile,
      this._doctorName,
      this._date,
      this._question,
      this._answer,
      this._likes);

  String get answer => _answer;

  set answer(String value) {
    _answer = value;
  }

  String get question => _question;

  set question(String value) {
    _question = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get doctorName => _doctorName;

  set doctorName(String value) {
    _doctorName = value;
  }

  String get imageDoctorProfile => _imageDoctorProfile;

  set imageDoctorProfile(String value) {
    _imageDoctorProfile = value;
  }

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }

  String get imageUserProfile => _imageUserProfile;

  set imageUserProfile(String value) {
    _imageUserProfile = value;
  }

  int get likes => _likes;

  set likes(int value) {
    _likes = value;
  }

  static List<QuestionItemModel> questionModel = [
    new QuestionItemModel(0,
        "assets/images/profile1.jpg",
        "Amir",
        "assets/images/profile2.jpg",
        "Ehab",
        "13/11/200",
        "ما هو علاج انتفاخ القولون",
        "برشام zombrax",
        4),
    new QuestionItemModel(1,
        "assets/images/profile3.jpg",
        "Hatem",
        "assets/images/profile4.jpg",
        "Elkoshny",
        "11/11/200",
        "عندى دمل فى بطنى تاعبنى ",
        " تعالى افقعهولك ",
        100),
    new QuestionItemModel(2,
        "assets/images/profile2.jpg",
        "Atef",
        "assets/images/profile1.jpg",
        "Mazen",
        "3/11/200",
        "اشعر بالصداع المزمن",
        " خدلك برشامه صداع",
        -10),

  ];
}
