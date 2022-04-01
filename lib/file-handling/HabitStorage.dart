import 'dart:io';

import 'package:path_provider/path_provider.dart';

class HabitStorage {
  HabitStorage(this.fileName);

  String fileName;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  Future<File> writeHabitJson(String habit) async {
    final file = await _localFile;
    return file.writeAsString(habit);
  }

  Future<String> readHabitJson() async {
    try {
      final file = await _localFile;

      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      return "Failed";
    }
  }

  String getFileName() {
    return this.fileName;
  }

  void setFileName(String fileName) {
    this.fileName = fileName;
  }
}
