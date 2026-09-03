import 'package:gapper/pages/frames/setup.dart';
import 'app.dart';

import 'features.dart';   /// List of booleans for toggling features
import 'globals.dart';    /// List of global variable. View definition for more details

import 'wrappers/gemini.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:gapper/pages/frames/setup/gemini_key.dart';


Future<void> main() async {
  print("Running with Firebase Enabled :  ${FIREBASE_ENABLED}");
  print("Running with Gemini Enabled :    ${GEMINI_ENABLED}");
  print("Running in offline mode :        ${OFFLINE}");


  WidgetsFlutterBinding.ensureInitialized();

  if (FIREBASE_ENABLED){
    await Firebase.initializeApp();

    /// If `flutter run` without `--release`
    if (kDebugMode) {
      /// Start dev auth instance with `firebase emulators:start --only auth,`
      await FirebaseAuth.instance.useAuthEmulator("localhost", 9099);
    }
  }

  /// `SharedPreferences` is a simple persistant key value store
  //   Example Below
  final settings = await SharedPreferences.getInstance();
  final String? gemini_api_key = await settings.getString("GEMINI_API_KEY");
  ShouldBeSecureKeys.GEMINI_API_KEY = gemini_api_key;



  // TODO: paste this somewhere
  // FirebaseAuth.instance
  //     .authStateChanges()
  //     .listen((User? user) {
  //   if (user == null)
  //     print("User is currently signed out!");
  //   else
  //     print("User is signed in (${user.email})");
  //
  // });


  runApp(App(api_key: gemini_api_key));
}


bool is_asking_for_gemini_key = false;

Future<void> askForGeminiKey() async {
  if (GEMINI_ENABLED) {
    if (!is_asking_for_gemini_key) {
      if (AppState.NAVKEY.currentState != null) {
        await Future.delayed(const Duration(seconds: 1));
        AppState.NAVKEY.currentState!.push(
            MaterialPageRoute(builder: (context) => GeminiKeyFrame())
        );
        is_asking_for_gemini_key = true;
      }
    }
  }
}




