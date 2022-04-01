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
    return file.writeAsString(
        "{\r\n \"habit\": {\r\n   \"name\": \"Train\",\r\n   \"description\": \"Lift Weights or use body wheight\",\r\n   \"data\": [\r\n     {\r\n       \"date\": \"2022-03-10\",\r\n       \"value\": true\r\n     },\r\n     {\r\n       \"date\": \"2022-03-09\",\r\n       \"value\": true\r\n     },\r\n     {\r\n       \"date\": \"2022-03-11\",\r\n       \"value\": true\r\n     }\r\n     ]\r\n }\r\n}");
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
