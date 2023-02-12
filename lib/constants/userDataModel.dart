import 'dart:convert';

class UserData {
  UserData({
    this.userImg = "",
    this.username = "",
    this.userDoc = "",
    this.uid = "",
    this.email = "",
  });

  String? userImg;
  String? username;
  String? userDoc;
  String? uid;
  String? email;

  UserData copyWith({
    String? userImg,
    String? username,
    String? userDoc,
    String? uid,
    String? email,
  }) =>
      UserData(
        username: username ?? this.username,
        userImg: userImg ?? this.userImg,
        userDoc: userDoc ?? this.userDoc,
        email: email ?? this.email,
        uid: uid ?? this.uid,
      );

  factory UserData.fromRawJson(String str) =>
      UserData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        username: json["username"],
        userImg: json["userImg"],
        userDoc: json["UserDoc"],
        email: json["email"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "userImg": userImg,
        "userDoc": userDoc,
        "email": email,
        "uid": uid,
      };
}
