import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gapper/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gapper/data/mood.dart';

class AppState {
  static var HTTP_CLIENT = HttpClient();
  // ASk for API key on first launch
  static late final AppLifecycleListener LIFECYCLE;
  static final GlobalKey<NavigatorState> NAVKEY = GlobalKey<NavigatorState>();
}

class ShouldBeSecureKeys {
  static late final String? GEMINI_API_KEY;
}

class Filesystem {
  static late var TMP_DIR;
  // Files the users should be able to access
  static late var DOCS_DIR;
  // More difficult to access files
  static late var APP_SUPPORT;

  static void initialize() async {
    TMP_DIR = await getTemporaryDirectory();
    DOCS_DIR = await getApplicationDocumentsDirectory();
    APP_SUPPORT = await getApplicationSupportDirectory();
  }

  // https://xkcd.com/908/
  // They changed it
  static final THE_CLOUD = FirebaseFirestore.instance;
  static final DATABASE = THE_CLOUD;

  /// Copying the syntax of firebase firestore
  static Future<Collection> collection(String name) async {
    final directory = Directory('${DOCS_DIR.path}/${name}');

    if (!await directory.exists()) {
      //recursive: true
      await directory.create();
    }

    return Collection(directory);
  }
}

class Collection {
  Directory dir;
  Collection(this.dir);

  Future<void> add(Map<String, dynamic> ser_json, String filename) async {
    final file = File('${dir.path}/${filename}');
    if (!await file.exists()) {
      await file.create(recursive: true);
    }
    print("Wrote to ${file.path}");
    await file.writeAsString(jsonEncode(ser_json));
  }
}

final db = Filesystem.DATABASE;
