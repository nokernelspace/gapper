import 'package:flutter/material.dart';
import 'package:gapper/data/mood.dart';
import 'package:gapper/widgets/mood_toggle.dart';
import 'package:gapper/widgets/mood_slider.dart';

class MoodTab extends StatefulWidget {
  /// State
  Mood current_mood = Mood();
  @override
  State<MoodTab> createState() => _MoodTab();
}

class _MoodTab extends State<MoodTab> {

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Modes
              Text("Modes", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),

              Padding(
                padding: EdgeInsetsGeometry.fromLTRB(
                  75.0,
                  0.0,
                  75.0,
                  0.0
                ),
                child:Column(children: [
              MoodToggle(widget.current_mood.modes.learning, label: const Text(" Learning")),
              MoodToggle(widget.current_mood.modes.physical, label: const Text(" Physical")),
              MoodToggle(widget.current_mood.modes.relax,    label: const Text("   Relax  ")),
              MoodToggle(widget.current_mood.modes.working,  label: const Text(" Working")),

              ],)),
              SizedBox(height: 16),

              /// Happy
              Text("Happy", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),
              MoodSlider(widget.current_mood.happy.joy, label: const Text("Joy")),
              MoodSlider(widget.current_mood.happy.confidence, label: const Text("Confidence")),
              MoodSlider(widget.current_mood.happy.determination, label: const Text("Determination")),
              MoodSlider(widget.current_mood.happy.fufillment, label: const Text("Fufillment")),
              SizedBox(height: 16),

              /// Sad
              Text("Sad", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),
              MoodSlider(widget.current_mood.sad.disgust, label: const Text("Disgust")),
              MoodSlider(widget.current_mood.sad.dissapointment, label: const Text("Dissapointment")),
              MoodSlider(widget.current_mood.sad.stress, label: const Text("Stress")),
              MoodSlider(widget.current_mood.sad.worry, label: const Text("Worry")),
              SizedBox(height: 16),

              /// Notes
              Column(),
            ],
          ),
        ),
      ),
    );
  }
}
