import 'package:flutter/material.dart';
import 'package:gapper/data/mood.dart';

class MoodLog extends StatelessWidget{
  List<Mood> moods;
  MoodLog(this.moods); 

  @override
  Widget build(BuildContext ctx) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: moods.length,
      itemBuilder: (BuildContext ctx, int idx) {
        return const Text("asdsa");
      },
      separatorBuilder: (BuildContext ctx, int idx) {
        return const SizedBox(
          height: 1.0,
          width: double.infinity,
        );
      }
    );
  }
}