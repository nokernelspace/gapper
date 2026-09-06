import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'package:gapper/utils.dart';
import 'dart:io';

abstract class FromJson<T> {
  /// NOTE: MUST cast to T
  static dynamic fromJson(Map<String, dynamic> json){
    throw Exception("Unimplemented");
  }
}

typedef NoiceCollection = Collection;
class Collection<T> {
  Directory dir;
  Collection(this.dir);

  Future<void> add(Map<String, dynamic> mapToJson, String filename) async {
    final file = File('${dir.path}/${filename}');
    if (!file.existsSync()) {
      await file.create(recursive: true);
    }
    print("Wrote to ${file.path}");
    await file.writeAsString(jsonEncode(mapToJson));
  }
  Future<List<T>> sortedList() async {
    List<T> out = List.empty(growable: true);
    await for (final file in Directory('${dir.path}').list()) {
      if (file is File && getFilePathExtension(file.path) == "mood") {
        var txt = file.readAsStringSync();
        // out.add(T.name fromJson(jsonDecode(txt)));
      }
    }

    return out;
  }

  // List<Mood> sortedListSync() {
  //   List<Mood> out = List.empty(growable: true);
  //   for (final file in Directory('${dir.path}').listSync()) {
  //     if (file is File && getFilePathExtension(file.path) == "mood") {
  //       var txt = file.readAsStringSync();
  //       // out.add(Mood.fromJson(jsonDecode(txt)));
  //     }
  //   }

  //   return out;
  // }
}

class Filesystem {
  static late var TMP_DIR;
  // Files the users should be able to access
  static late var DOCS_DIR;
  // More difficult to access files
  static late var APP_SUPPORT;

  static void initialize() async {
    TMP_DIR = await getTemporaryDirectory();
    if (Platform.isAndroid) {
      DOCS_DIR = await getExternalStorageDirectory();
    }
    else {
      DOCS_DIR = await getApplicationDocumentsDirectory();
    }
    APP_SUPPORT = await getApplicationSupportDirectory();
  }

  // https://xkcd.com/908/
  // They changed it
  // static final THE_CLOUD = FirebaseFirestore.instance;
  // static final DATABASE = THE_CLOUD;

  /// Wrapper For keeping it simple, stupid
  static Collection dir(String name) {
    return collection(name);
  }
  /// Copying the syntax of firebase firestore
  static Collection collection(String name) {
    final directory = Directory('${DOCS_DIR.path}/${name}');

    if (!directory.existsSync()) {
      //recursive: true
      directory.createSync();
    }

    return Collection(directory);
  }
}