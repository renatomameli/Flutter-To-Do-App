import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileManager {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/habits.json');
  }

  Future<String> readFile() async {
      final file = await _localFile;
      try {
        return await file.readAsString();
      } catch (e) {
        print(e);
        return "";
      }
  }

  Future<File> writeFile(String value) async {
    final file = await _localFile;
    return file.writeAsString('$value');
  }
}