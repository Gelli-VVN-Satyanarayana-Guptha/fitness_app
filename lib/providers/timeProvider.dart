import 'package:flutter/material.dart';
//import "package:provider/provider.dart";

class TimeProvider extends ChangeNotifier {
  String jogtime = "";
  String cycletime = "";
  String yogatime = "";

  set jtime(
    String jotime,
  ) {
    jogtime = jotime;
    notifyListeners();
  }

  set ctime(
    String cytime,
  ) {
    cycletime = cytime;
    notifyListeners();
  }

  set ytime(
    String yotime,
  ) {
    yogatime = yotime;
    notifyListeners();
  }

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
