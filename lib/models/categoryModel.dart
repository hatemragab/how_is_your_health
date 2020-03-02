class categoryModel {
  String _image;
  String _categoryName;

  categoryModel(this._image, this._categoryName);

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get categoryName => _categoryName;

  set categoryName(String value) {
    _categoryName = value;
  }

  static List<categoryModel> categoryList = [
    new categoryModel("assets/images/doctor.jpg", "Dentist"),
    new categoryModel("assets/images/Capture.PNG", "Stomach"),
    new categoryModel("assets/images/doc.jpg", "Surgery"),
    new categoryModel("assets/images/doctora.jpg", "children"),
    new categoryModel("assets/images/doctor.jpg", "Dentist"),
    new categoryModel("assets/images/Capture.PNG", "Stomach"),
    new categoryModel("assets/images/doc.jpg", "Surgery"),
    new categoryModel("assets/images/doctora.jpg", "children"),
    new categoryModel("assets/images/doctor.jpg", "Dentist"),
    new categoryModel("assets/images/doc.jpg", "Surgery"),
    new categoryModel("assets/images/doctora.jpg", "children"),
    new categoryModel("assets/images/doctor.jpg", "Dentist"),

  ];
}
