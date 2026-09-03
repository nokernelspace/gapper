import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gapper/pages/frames/start.dart';
import 'globals.dart';
import 'pages/frames/setup.dart';
import 'dart:math';

class App extends StatefulWidget {
  final String? api_key;

  App({required this.api_key});


  @override
  State<App> createState() => _App();

}

class _App extends State<App> {
  // final bool need_gemini_key;
  // _App({required this.need_gemini_key});



  @override
  void initState() {
    super.initState();

    /// Could be commented out. Might be useful???
    AppState.LIFECYCLE= AppLifecycleListener(
        onResume: (() async {
          //await askForGeminiKey();
          print("onResume()");
        }),
        onInactive: () {
          print("onInactive()");
        },
        onHide: () {
          print("onHide");
        },
        onShow: () {
          print("onShow");
        },
        onRestart: () {
          print("onRestart()");
        },
        onPause: () {
          print("onPause()");
        },
        onDetach: () {
          print("onDetach()");
        }
    );

  }

  @override
  void dispose() {
    AppState.LIFECYCLE.dispose();
    super.dispose();
  }

  // Only called once on app login
  bool setup_one_shot = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (SetupPage.needs_setup() && !setup_one_shot) {
        /// In release mode make the user wait so they can explore the app on first launch
        /// This is intentional
        if (!kDebugMode) {
          int randomNumber = 3 +
              Random().nextInt(16 - 3 + 1); /// TODO: Number Theory
          await Future.delayed(Duration(seconds: randomNumber));
        }
        setup_one_shot = true;   /// Flag so that on every redraw we don't change the page
        AppState.NAVKEY.currentState!.pushNamed('/setup');
        ///                         ? don't use ?. See if we ever run into a panic

        // AppState.NAVKEY.currentState!.push(
        //     MaterialPageRoute(builder: (context) => SetupPage())
        // );
      }
    });


    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: AppState.NAVKEY,
            title: 'Flutter Demo',
            theme: ThemeData.dark(),
            // home: const StartPage(title: 'asdasdds')

            initialRoute: '/',
            routes: {
              '/' : (ctx) => const StartPage(title: "asdasd"),
              '/setup' : (ctx) => SetupPage(),
            }
        )
    );
  }

}