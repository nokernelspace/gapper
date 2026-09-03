
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class AppState {
  static var HTTP_CLIENT = HttpClient();
  // ASk for API key on first launch
  static late final AppLifecycleListener LIFECYCLE;
  static final GlobalKey<NavigatorState> NAVKEY = GlobalKey<NavigatorState>();

}

class Keys {
  static late final String? GEMINI_API_KEY;
}

class Filesystem {
  static final TMP_DIR = getTemporaryDirectory();

// Files the users should be able to access
  static final DOCS_DIR = getApplicationDocumentsDirectory();

// More difficult to access files
  static final APP_SUPPORT = getApplicationSupportDirectory();
}
