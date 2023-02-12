import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:fitness_app/constants/userDataModel.dart';

class UserProvider extends ChangeNotifier {
  UserData _userData = UserData(
    userImg: "",
    username: "",
    userDoc: "",
    uid: "",
    email: "",
  );

  bool get iDonor => false;

  UserData get userData => _userData;

  set userData(UserData userData) {
    _userData = userData;
    notifyListeners();
  }

  // update the user data
  void updateUserData(data) {
    _userData.username = data;

    notifyListeners();
  }
}
