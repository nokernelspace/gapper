import 'package:flutter/material.dart';
import 'package:gapper/data/mood.dart';

class MoodLog extends StatelessWidget {
  List<Mood> moods;
  final ValueNotifier<Mood> mood;
  MoodLog(this.moods, this.mood, {super.key});

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

            return ListTile(
              key: key, 
              title: Text(mood.people.name),
              onTap: () {

              }
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
