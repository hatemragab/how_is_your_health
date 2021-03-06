import 'dart:convert';

class UserModel {
  String name;
  String id;
  String email;
  String phone;
  String password;
  String img;
  List<String> ABO;
  String height;
  String weight;
  String is_doctor;

  UserModel(
      {this.name,
      this.email,
      this.phone,
      this.password,
      this.img,
      this.ABO,
      this.is_doctor,
      this.id,
      this.height,
      this.weight});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['is_doctor'] = is_doctor;
    map['password'] = password;
    return map;
  }

  // Extract a Note object from a Map object
  UserModel.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.email = map['email'];
    this.phone = map['phone'];
    this.is_doctor = map['is_doctor'];
    this.password = map['password'];
  }

//  static toMap(UserModel userModel) {
//    Map<String, String> map = new Map();
//    map['name'] = userModel.name;
//    map['email'] = userModel.email;
//    map['phone'] = userModel.phone;
//
//    return map;
//  }

  static fromMap(Map map) {
    return UserModel(
        name: map['name'], email: map['email'], phone: map['phone'],is_doctor: map['is_doctor']);
  }

  @override
  String toString() {

    return '{"name":"$name","email":"$email","phone":"$phone","img":"$img"}';
  }
}
