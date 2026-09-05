import 'package:flutter/material.dart';
import 'package:gapper/pages/tabs/chats_tab.dart';
import 'package:gapper/pages/tabs/log_tab.dart';
import 'package:gapper/pages/tabs/mood_tab.dart';
import 'package:gapper/pages/tabs/notebooks_tab.dart';
import 'package:gapper/features.dart';
import 'package:gapper/utils.dart';
import 'package:gapper/globals.dart';
import 'package:gapper/data/mood.dart';
import 'package:gapper/widgets/mood_log.dart';

import 'dart:async';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  int current_idx = 0;
  late PageController page_controller;
  late List<Mood> moods;

  _StartPage() {
    page_controller = PageController(initialPage: current_idx);
  }



  @override
  Widget build(BuildContext context) {
    // First 2 are default tabs, last 2 are GEMINI enabled tabs
    List<BottomNavigationBarItem> tab_items = [
      BottomNavigationBarItem(icon: Icon(Icons.mood), label: "Mood"),
    ];
    () {
      if (GEMINI_ENABLED) {
        tab_items.add(
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
        );
        tab_items.add(
          BottomNavigationBarItem(icon: Icon(Icons.note), label: "Notebooks"),
        );
      }

      if (!VIEW_LOG_AS_SHEET) {
        tab_items.add(
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "Log"),
        );
      }
    }();

    List<Widget> tab_frames = [MoodTab()];
    () {
      if (GEMINI_ENABLED) {
        tab_frames.add(ChatsTab());
        tab_frames.add(NotebooksTab());
      }

      if (!VIEW_LOG_AS_SHEET) {
        tab_frames.add(LogTab());
      }
    }();
    // var mood_tab = (tab_frames[0] as MoodTab);
    // mood_tab.state.current_mood.toString();

    ValueNotifier<Mood> mood = ValueNotifier(Mood());

    return Scaffold(
      appBar: AppBar(
        leading: VIEW_LOG_AS_SHEET
            ? Builder(builder: (context) {
                return IconButton(
                icon: Icon(Icons.newspaper),
                onPressed: () {
                  Filesystem.collection("moods").sortedList().then((moods) {
                    print("askdjansndk");
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return MoodLog(moods);
                      },
                    );
                  });
                },
              );
            })
            : null,
        title: Text("idk"),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {}),

          IconButton(icon: Icon(Icons.copy), onPressed: () {}),

          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              // TODO: HACKY FIX
              // Reading state on Press which is why we can do this
              if (FIREBASE_ENABLED) {
                db.collection("moods").add(mood.value.toJson());
              } else if (OFFLINE) {
                await Filesystem.collection("moods").add(
                  mood.value.toJson(),
                  // Need filename because we are not a datastore. Yet (•͡˘㇁•͡˘)
                  sanitizeFilename(mood.value.time.toString()) + ".mood",
                );

                await Filesystem.collection("moods").sortedList();
              }
              showSnackBar(context, "Saved!");
            },
          ),
        ],
      ),
      body: Padding(
        child: PageView(children: tab_frames, controller: page_controller),
        padding: EdgeInsetsGeometry.all(10),
      ),
      bottomNavigationBar: !VIEW_LOG_AS_SHEET
          ? BottomNavigationBar(
              currentIndex: current_idx,
              onTap: (_idx) {
                setState(() {
                  current_idx = _idx;
                  page_controller.jumpToPage(current_idx);
                });
              },
              type: BottomNavigationBarType.fixed,
              items: tab_items,
            )
          : null,
    );
  }
}
