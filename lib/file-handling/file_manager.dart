import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileManager {
  static FileManager? _instance;

  FileManager._internal() {
    _instance = this;
  }

  factory FileManager() => _instance ?? FileManager._internal();

  Future<String> get _directoryPath async {
    Directory? dir = await getExternalStorageDirectory();
    return dir!.path;
  }

  Future<File> get _file async {
    String path = await _directoryPath;
    return File('$path/fff.txt');
  }

  Future<String> readTextFile() async {
    String fileContent = "No Text";
    File file = await _file;

    if (await file.exists()) {
      try {
        fileContent = await file.readAsString();
      } catch (e) {
        print(e);
      }
    }
    return fileContent;
  }

  Future<String> writeTextFile(String text) async{
    File file = await _file;
    await file.writeAsString(text);
    return text;
  }
}
