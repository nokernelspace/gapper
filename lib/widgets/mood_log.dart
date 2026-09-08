import 'package:flutter/material.dart';
import 'package:gapper/data/mood.dart';
import 'package:gapper/utils.dart';

class MoodLog extends StatefulWidget {
  List<Mood> moods;
  final ValueNotifier<Mood> current_mood;
  MoodLog(this.moods, this.current_mood, {super.key});

  @override
  State<MoodLog> createState() =>
      _MoodLog(this.moods, this.current_mood, key: this.key);
}

class _MoodLog extends State<MoodLog> {
  List<Mood> moods;
  final ValueNotifier<Mood> current_mood;
  Key? key;
  _MoodLog(this.moods, this.current_mood, {this.key});

  @override
  Widget build(BuildContext ctx) {
    // group moods by day so we can have neet little sections when scrolling through logged moods
    Map<DateTime, List<Mood>> day_map = Map();
    for (Mood mood in moods) {
      var date = DateTime(mood.time.year, mood.time.month, mood.time.day);
      if (!day_map.containsKey(date)) {
        day_map[date] = List.empty(growable: true);
      }
      var day_entry = day_map[date]!;
      day_entry.add(mood);
    }

    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: moods.length,
          itemBuilder: (BuildContext ctx, int idx) {
            var mood = moods[idx]!;
            var time = mood.time;

            return ListTile(
              key: key,
              title: Text(mood.people.name),
              subtitle: Text(formatTime(time)),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  mood.notes.length == 1 ? Text(mood.notes[0]) : Text("${mood.notes.length} Notes"),
                  Text(formatDate(time))
                ]
              ),

              onTap: () {
                setState(() {
                  current_mood.value = mood;
                });
              },
            );
          },
          separatorBuilder: (BuildContext ctx, int idx) {
            return const SizedBox(height: 1.0, width: double.infinity);
          },
        ),
      ],
    );
  }
}
