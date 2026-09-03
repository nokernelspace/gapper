import 'package:flutter/material.dart';
import 'package:gapper/wrappers/gemini.dart';
import 'package:gapper/features.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key, required this.title});

  final String title;

  @override
  State<StartPage> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  @override
  Widget build(BuildContext context) {

    // First 2 are default tabs, last 2 are GEMINI enabled tabs
    List<BottomNavigationBarItem> tabItems = () {
      if (GEMINI_ENABLED) {
        return const [
          BottomNavigationBarItem(icon: Icon(Icons.mood), label: "Mood"),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "Log"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: "Notebooks")
        ];
      }
      else{
        return const [
          BottomNavigationBarItem(icon: Icon(Icons.mood), label: "Mood"),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "Log")
        ];
      }

    }();




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
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (idx) {

          },
          type: BottomNavigationBarType.fixed,
          items: tabItems
      ),
    );
  }
}