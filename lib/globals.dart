import 'dart:io';

import 'package:flutter/material.dart';

class AppState {
  static var HTTP_CLIENT = HttpClient();
  // ASk for API key on first launch
  static late final AppLifecycleListener LIFECYCLE;
  static final GlobalKey<NavigatorState> NAVKEY = GlobalKey<NavigatorState>();
}

class ShouldBeSecureKeys {
  static late final String? GEMINI_API_KEY;
}



