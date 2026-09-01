import 'dart:io';

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:gapper/pages/gemini_key.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

var HTTP_CLIENT = HttpClient();
// ASk for API key on first launch
late final AppLifecycleListener LIFECYCLE;
final GlobalKey<NavigatorState> NAVKEY = GlobalKey<NavigatorState>();

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
  State<App> createState() => _App();

}

Future<void> askForGeminiKey() async {
  if (NAVKEY.currentState != null) {
    await Future.delayed(const Duration(seconds: 1));
    NAVKEY.currentState!.push(
        MaterialPageRoute(builder: (context) => GeminiKeyPage())
    );
  }
}

class _App extends State<App> {
  // final bool need_gemini_key;
  // _App({required this.need_gemini_key});

  /// Very important for not having to push the route every new page in flutter

  _App() {
  }

  @override
  void initState() {
    super.initState();
    LIFECYCLE= AppLifecycleListener(
        onResume: (() async {
          await askForGeminiKey();
        })
    );
  }

  @override
  void dispose() {
    LIFECYCLE.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
        await askForGeminiKey();
    });


    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: NAVKEY,
            title: 'Flutter Demo',
            theme: ThemeData.dark(),
            home: const StartPage(title: 'asdasdds')
        )
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
