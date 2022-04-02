import 'package:flutter/cupertino.dart';

import 'file_manager.dart';

class FileController extends ChangeNotifier{
  String? _text;

  String? get text => _text;

  readText() async {
    _text = await FileManager("1.txt").readTextFile();
    notifyListeners();
  }

  writeText(String text) async {
    _text = await FileManager("1.txt").writeTextFile(text);
    notifyListeners();
  }
}