import 'dart:convert';

class UserModel {
  String fullName;
  String uId;
  String email;
  String bio;
  String photoURL;
  UserModel({
    required this.fullName,
    required this.uId,
    required this.email,
    required this.bio,
    required this.photoURL,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': fullName,
      'uId': uId,
      'email': email,
      'bio': bio,
      'photoURL': photoURL,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullName: map['fullName'] as String,
      uId: map['uId'] as String,
      email: map['email'] as String,
      bio: map['bio'] as String,
      photoURL: map['photoURL'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
