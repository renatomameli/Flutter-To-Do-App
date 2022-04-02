import 'package:flutter/cupertino.dart';

import 'file_manager.dart';

class FileController extends ChangeNotifier{
  late String _text;

  String get text => _text;

  readText() async {
    _text = await FileManager().readTextFile();
    notifyListeners();
  }

  writeText(String text) async {
    _text = await FileManager().writeTextFile(text);
    notifyListeners();
  }
}