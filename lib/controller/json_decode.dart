// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/image_model.dart';

class puzz_provider extends ChangeNotifier {
  bool isDark = false;
  bool showMore = false;
  int? toggleIndex;
  List<PuzzImg> allChapters = [];

  void refresh() {
    notifyListeners();
  }

  void sMore() {
    showMore = true;
    notifyListeners();
  }

  void sLess() {
    showMore = false;
    notifyListeners();
  }

  void setToogleIndex(int? val) {
    toggleIndex = val;
    notifyListeners();
  }

  void changeTheme(bool val) {
    isDark = val;
    notifyListeners();
  }

  Future<void> loadJson() async {
    var fileData = await rootBundle.loadString("assets/all_puzz.json");
    jsonDecode(fileData);
    allChapters = puzzImgFromJson(fileData);
  }
}
