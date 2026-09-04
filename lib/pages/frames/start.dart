import 'package:flutter/material.dart';
import 'package:gapper/pages/tabs/chats_tab.dart';
import 'package:gapper/pages/tabs/log_tab.dart';
import 'package:gapper/pages/tabs/mood_tab.dart';
import 'package:gapper/pages/tabs/notebooks_tab.dart';
import 'package:gapper/features.dart';
import 'package:gapper/utils.dart';
import 'package:gapper/globals.dart';
import 'package:gapper/data/mood.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key, required this.title});

  final String title;

  @override
  State<StartPage> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  int current_idx = 0;
  late PageController page_controller;

  _StartPage() {
    page_controller = PageController(initialPage: current_idx);
  }

  @override
  Widget build(BuildContext context) {
    // First 2 are default tabs, last 2 are GEMINI enabled tabs
    List<BottomNavigationBarItem> tab_items = () {
      if (GEMINI_ENABLED) {
        return const [
          BottomNavigationBarItem(icon: Icon(Icons.mood), label: "Mood"),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "Log"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: "Notebooks"),
        ];
      } else {
        return const [
          BottomNavigationBarItem(icon: Icon(Icons.mood), label: "Mood"),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "Log"),
        ];
      }
    }();

    List<Widget> tab_frames = () {
      if (GEMINI_ENABLED) {
        return [MoodTab(), LogTab(), ChatsTab(), NoteboksTab()];
      } else {
        return [MoodTab(), LogTab()];
      }
    }();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(icon: Icon(Icons.add),
            onPressed: () {

            },
          ),

          IconButton(icon: Icon(Icons.copy),
            onPressed: () {

            },
          ),


          IconButton(icon: Icon(Icons.save),
            onPressed: () async {
              Mood mood = (tab_frames[0] as MoodTab).state.current_mood;
              if (FIREBASE_ENABLED) {
                db.collection("moods").add(mood.toJson());
              }
              else if (OFFLINE){
                await (await Filesystem.collection("moods")).add(
                  mood.toJson(), 
                  // Need filename because we are not a datastore. Yet (•͡˘㇁•͡˘)
                  sanitizeFilename(mood.time.toString()) + ".mood"
                );
              }
              showSnackBar(context, "Saved!");
            },
          ),

        ],
      ),
      body: Padding(
        child: PageView(
          children: tab_frames,
          controller: page_controller,
        ),
        padding: EdgeInsetsGeometry.all(10),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current_idx,
        onTap: (_idx) {
          setState(() {
            current_idx = _idx;
            page_controller.jumpToPage(current_idx);
          });
        },
        type: BottomNavigationBarType.fixed,
        items: tab_items,
      ),
    );
  }
}
