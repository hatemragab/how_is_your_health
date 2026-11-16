import 'dart:convert';

class UserModel {
  UserModel({
    String? name,
    String? email,
    String? phone,
    String? password,
    String? img,
    List<String>? ABO,
    String? is_doctor,
    String? id,
    String? height,
    String? weight,
  }) : name = name ?? '',
       email = email ?? '',
       phone = phone ?? '',
       password = password ?? '',
       img = img ?? '',
       ABO = ABO ?? <String>[],
       is_doctor = is_doctor ?? '',
       id = id ?? '',
       height = height ?? '',
       weight = weight ?? '';

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

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'email': email,
    'phone': phone,
    'is_doctor': is_doctor,
    'password': password,
    'img': img,
    'ABO': ABO,
    'height': height,
    'weight': weight,
  };

  factory UserModel.fromMapObject(Map<String, dynamic> map) =>
      UserModel.fromMap(map);

  factory UserModel.fromMap(Map<String, dynamic> map) {
    final bloodGroups = map['ABO'];
    return UserModel(
      id: map['id']?.toString(),
      name: map['name']?.toString(),
      email: map['email']?.toString(),
      phone: map['phone']?.toString(),
      is_doctor: map['is_doctor']?.toString(),
      password: map['password']?.toString(),
      img: map['img']?.toString(),
      ABO: bloodGroups is List
          ? bloodGroups.whereType<String>().toList()
          : null,
      height: map['height']?.toString(),
      weight: map['weight']?.toString(),
    );
  }

  @override
  String toString() =>
      jsonEncode({'name': name, 'email': email, 'phone': phone, 'img': img});
}
