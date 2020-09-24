import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class SaveData{
  //function to get a file to save the data in memory
  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  //function used to save some data in the file
  Future<File> saveData(_data) async {
    String data = json.encode(_data);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  //function used to read some data in the file
  Future<String> readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}