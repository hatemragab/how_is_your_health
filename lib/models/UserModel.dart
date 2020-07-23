import 'dart:convert';

class UserModel {
  String name;
  String email;
  String phone;
  String password;
  String img;
  List<String> ABO;
  String height;
  String weight;

  UserModel(
      {this.name,
      this.email,
      this.phone,
      this.password,
      this.img,
      this.ABO,
      this.height,
      this.weight});

  static toMap(UserModel userModel) {
    Map<String, String> map = new Map();
    map['name'] = userModel.name;
    map['email'] = userModel.email;
    map['phone'] = userModel.phone;

    return map;
  }

  static fromMap(Map map) {
    return UserModel(
        name: map['name'], email: map['email'], phone: map['phone']);
  }

  @override
  String toString() {
    // TODO: implement toString
    return '{"name":"$name","email":"$email","phone":"$phone","img":"$img"}';
  }
}
