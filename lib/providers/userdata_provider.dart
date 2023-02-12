import 'package:flutter/material.dart';

class UserDataProvider extends ChangeNotifier {
  // String username = "username";
  // String imgstring = "https://cdn-icons-png.flaticon.com/512/8924/8924586.png";
  // String userdoc = "hNMR7Sp9egIk8DMkR77L";
  // String uid = "";
  // String email = "email@gmail.com";

  String jogtime = "00";
  String cycletime = "00";
  String yogatime = "00";

  // get getUserName => username;
  // get getUserDoc => userdoc;
  // get getEmail => email;
  // get getImgString => imgstring;
  // get getUid => uid;

  get jog => jogtime;
  get cycle => cycletime;
  get yoga => yogatime;

  // Future<void> setUserName(
  //   String name,
  // ) async {
  //   username = name;
  //   notifyListeners();
  // }

  // Future<void> setUserDoc(
  //   String doc,
  // ) async {
  //   userdoc = doc;
  //   notifyListeners();
  // }

  // Future<void> setImgString(
  //   String img,
  // ) async {
  //   imgstring = img;
  //   notifyListeners();
  // }

  // void setUid(
  //   String useruid,
  // ) {
  //   uid = useruid;
  //   notifyListeners();
  // }

  // Future<void> setEmail(String em) async {
  //   email = em;
  //   notifyListeners();
  // }

  void updateJogtime(String data) {
    jogtime = data;
    notifyListeners();
  }

  void updatecycletime(String data) {
    cycletime = data;
    notifyListeners();
  }

  void updateYogatime(String data) {
    yogatime = data;
    notifyListeners();
  }
}
