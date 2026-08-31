import 'dart:io';

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

var HTTP_CLIENT = HttpClient();

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn.instance.authenticate();
  final credential = GoogleAuthProvider.credential(idToken: googleUser!.authentication.idToken);

  return await FirebaseAuth.instance.signInWithCredential(credential);

}

final tmpDir = getTemporaryDirectory();

// Files the users should be able to access
final docsDir = getApplicationDocumentsDirectory();

// More difficult to access files
final appSupport = getApplicationSupportDirectory();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /// `SharedPreferences` is a simple persistant key value store
  //   Example Below
  final settings = await SharedPreferences.getInstance();
  final String? gemini_api_key = await settings.getString("GEMINI_API_KEY");


  /// If `flutter run` without `--release`
  if (kDebugMode)
  {
    /// Start dev auth instance with `firebase emulators:start --only auth,`
    await FirebaseAuth.instance.useAuthEmulator("localhost", 9099);
  }

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

class App extends StatefulWidget {
 final String? api_key;

 App({required this.api_key});


 @override
 State<App> createState() => _App(
     need_gemini_key: api_key == null
 );

}

class _App extends State<App> {
  final bool need_gemini_key;
  _App({required this.need_gemini_key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: need_gemini_key ? const StartPage(title: 'Need Gemini Key') : const StartPage(title: '?????')
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key, required this.title});

  final String title;

  @override
  State<StartPage> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            MaterialButton(
                onPressed: (){
                  signInWithGoogle();
                },
                child: const Text("Sign In")
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
