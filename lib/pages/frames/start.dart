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
import 'package:gapper/noice/lib.dart';

import 'dart:async';

class StartPage extends StatefulWidget {
  ValueNotifier<Mood> mood = ValueNotifier<Mood>(Mood());
  StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPage(this.mood);
}

class _StartPage extends State<StartPage> {
  int current_idx = 0;
  late PageController page_controller;
  ValueNotifier<Mood> mood;

  _StartPage(this.mood) {
    page_controller = PageController(initialPage: current_idx);
  }

  Future<void> save_current_mood() async {
    // Could be `await`ed
    db.collection("moods").add(mood.value.toJson());

    // Add to localstore
    await Filesystem.collection("moods").add(
      mood.value.toJson(),
      // Need filename because we are not a datastore. Yet (•͡˘㇁•͡˘)
      sanitizeFilename(mood.value.time.toString()) + ".mood",
    );
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

    List<Widget> tab_frames = [MoodTab(mood, key: widget.key)];
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


    return Scaffold(
      appBar: AppBar(
        leading: VIEW_LOG_AS_SHEET
            ? Builder(
                builder: (context) {
                  return IconButton(
                    icon: Icon(Icons.newspaper),
                    onPressed: () async {
                      var moods = await Filesystem.collection("moods")
                          .sortedList();

                      showModalBottomSheet(
                        isScrollControlled: true,
                        showDragHandle: true,
                        enableDrag: true,
                        context: context,
                        builder: (BuildContext context) {
                          return FractionallySizedBox(
                            heightFactor: 0.85,
                            child: MoodLog(moods, mood),
                          );
                        },
                      );
                    },
                  );
                },
              )
            : null,
        title: MaterialButton(
          child: Text(
            formatTime(mood.value.time),
            style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              save_current_mood();
              setState(() {
                mood.value = Mood();
              });

              showSnackBar(context, "New");
            },
          ),
          IconButton(
            icon: Icon(Icons.copy),
            onPressed: () {
              save_current_mood();
              var new_mood = Mood();
              var _mood = mood.value;
              new_mood.happy.confidence = _mood.happy.confidence;
              new_mood.happy.determination = _mood.happy.determination;
              new_mood.happy.fufillment = _mood.happy.fufillment;
              new_mood.happy.joy = _mood.happy.joy;

              new_mood.sad.disgust = _mood.sad.disgust;
              new_mood.sad.dissapointment = _mood.sad.dissapointment;
              new_mood.sad.stress = _mood.sad.stress;
              new_mood.sad.worry = _mood.sad.worry;

              new_mood.people = _mood.people;
              new_mood.modes.learning = _mood.modes.learning;
              new_mood.modes.physical = _mood.modes.physical;
              new_mood.modes.relax = _mood.modes.relax;
              new_mood.modes.working = _mood.modes.working;

              setState(() {
                mood.value = new_mood;
              });
              showSnackBar(context, "Reduplicated");
            },
          ),

          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              await save_current_mood();

              showSnackBar(context, "Saved!");
            },
          ),
        ],
      ),
      body: Padding(
        child: PageView(children: tab_frames, controller: page_controller),
        padding: EdgeInsetsGeometry.fromLTRB(10, 0, 10, 0),
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
