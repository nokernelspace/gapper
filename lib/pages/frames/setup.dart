import 'package:flutter/material.dart';
import 'package:gapper/pages/frames/setup/gemini_key.dart';
import 'package:gapper/globals.dart';
import 'package:gapper/features.dart';
import 'package:gapper/pages/frames/setup/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetupPage extends StatefulWidget {
  SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPage();


  static bool needs_setup() {
    return (GEMINI_ENABLED && Keys.GEMINI_API_KEY == null) || (!OFFLINE);
  }
}

class _SetupPage extends State<SetupPage>
    with TickerProviderStateMixin{

  late AnimationController controller;
  @override
  void initState(){
    controller =
    AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true)..addListener(() {
      setState(() {}); /// TODO: Why is this needed for a determinate progress bar?
    });
  }


  final ValueNotifier<bool> loading = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    List<Widget> setup_pages = [];
    /// Calculate how many setup screens we need
    int total = 0;

    if (GEMINI_ENABLED && Keys.GEMINI_API_KEY == null) {
      total++;
      setup_pages.add(GeminiKeyFrame());
    }
    // TODO:  && Keys.FIREBASE_TOKEN == null
    else if (!OFFLINE) {
      total++;
      setup_pages.add(LoginFrame(loading));
    }



    return Scaffold(

      /*
      *
      *
      *
      appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: LinearProgressIndicator(
                  value: controller.value
              ))),
      *
      *
      * */


        appBar: AppBar(
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(4),
                child: ValueListenableBuilder<bool>(
                    valueListenable: loading,
                    builder: (ctx, isLoading, child) {
                      return isLoading ? LinearProgressIndicator(
                        // value: controller.value
                          value: null
                      ) : Container();
                    }
                )


    ),
    title: const Text("Setup", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
    automaticallyImplyLeading: false,
    ),
    body: PageView.builder(
    itemCount: total,
    itemBuilder: (ctx, idx) {
    return setup_pages[idx];
    }
    )
    );
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}