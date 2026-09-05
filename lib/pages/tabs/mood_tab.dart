import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gapper/data/mood.dart';
import 'package:gapper/widgets/mood_toggle.dart';
import 'package:gapper/widgets/mood_slider.dart';
import 'package:gapper/features.dart';

class MoodTab extends StatefulWidget {
  late _MoodTab state;

  MoodTab({super.key});

  /// State
  @override
  // ignore: no_logic_in_create_state
  State<MoodTab> createState() {
    var state = _MoodTab();
    this.state = state;
    return state;
  }
}

class _MoodTab extends State<MoodTab> with AutomaticKeepAliveClientMixin {
  Mood current_mood = Mood();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext ctx) {
    super.build(ctx);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Modes
              Text(
                "Modes",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),

              Padding(
                padding: EdgeInsetsGeometry.fromLTRB(75.0, 0.0, 75.0, 0.0),
                child: Column(
                  children: [
                    MoodToggle(
                      current_mood.modes.learning,
                      label: const Text(" Learning"),
                    ),
                    MoodToggle(
                      current_mood.modes.physical,
                      label: const Text(" Physical"),
                    ),
                    MoodToggle(
                      current_mood.modes.relax,
                      label: const Text("   Relax  "),
                    ),
                    MoodToggle(
                      current_mood.modes.working,
                      label: const Text(" Working"),
                    ),
                    SizedBox(height: 10),
                    DropdownMenu<People>(
                      requestFocusOnTap: true,
                      label: const Text("People"),
                      initialSelection: People.I,
                      onSelected: (People? who) {
                        if (who != null) {
                          current_mood.people = who;
                        }
                      },
                      dropdownMenuEntries: People.entries,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              /// Happy
              Text(
                "Happy",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
              MoodSlider(current_mood.happy.joy, label: const Text("Joy")),
              MoodSlider(
                current_mood.happy.confidence,
                label: const Text("Confidence"),
              ),
              MoodSlider(
                current_mood.happy.determination,
                label: const Text("Determination"),
              ),
              MoodSlider(
                current_mood.happy.fufillment,
                label: const Text("Fufillment"),
              ),
              SizedBox(height: 16),

              /// Sad
              Text(
                "Sad",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
              MoodSlider(
                current_mood.sad.disgust,
                label: const Text("Disgust"),
              ),
              MoodSlider(
                current_mood.sad.dissapointment,
                label: const Text("Dissapointment"),
              ),
              MoodSlider(current_mood.sad.stress, label: const Text("Stress")),
              MoodSlider(current_mood.sad.worry, label: const Text("Worry")),
              SizedBox(height: 16),

              /// Notes
              Column(
                children: [
                  Text(
                    "Notes",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                  ),
                  //SizedBox(
                  // height: 100,
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 500),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, idx) {
                        return Slidable(
                          startActionPane: ActionPane(
                            extentRatio: SLIDABLE_EXTENT,
                            motion: const ScrollMotion(),
                            dismissible: DismissiblePane(onDismissed: () {}),
                            children: [
                              SlidableAction(
                                onPressed: (ctx) {},
                                icon: Icons.delete,
                                backgroundColor: Colors.red,
                                label: "delete",
                              ),
                              SlidableAction(
                                flex: 3,
                                onPressed: (ctx) {},
                                icon: Icons.edit,
                                backgroundColor: Colors.yellow,
                                label: "edit",
                              ),
                            ],
                          ),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 50),
                            child: Row(
                              children: [
                                Text("Hello World")
                              ]
                            ),
                          ),
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
