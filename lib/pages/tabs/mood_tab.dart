import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gapper/data/mood.dart';
import 'package:gapper/utils.dart';
import 'package:gapper/widgets/dialogs.dart';
import 'package:gapper/widgets/mood_toggle.dart';
import 'package:gapper/widgets/mood_slider.dart';
import 'package:gapper/features.dart';

class MoodTab extends StatefulWidget {
  late _MoodTab state;
  Key? key;
  ValueNotifier<Mood> mood;
  MoodTab(this.key, this.mood);

  /// State
  @override
  // ignore: no_logic_in_create_state
  State<MoodTab> createState() {
    var state = _MoodTab(this.key, this.mood);
    this.state = state;
    return state;
  }
}

class _MoodTab extends State<MoodTab> with AutomaticKeepAliveClientMixin {
  Key? key;
  _MoodTab(this.key, this.mood);

  ValueNotifier<Mood> mood;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext ctx) {
    super.build(ctx);

    return ValueListenableBuilder(
      valueListenable: mood,
      builder: (BuildContext ctx, Mood mood, Widget? child) {
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
                          mood.modes.learning,
                          label: const Text(" Learning"),
                        ),
                        MoodToggle(
                          mood.modes.physical,
                          label: const Text(" Physical"),
                        ),
                        MoodToggle(
                          mood.modes.relax,
                          label: const Text("   Relax  "),
                        ),
                        MoodToggle(
                          mood.modes.working,
                          label: const Text(" Working"),
                        ),
                        SizedBox(height: 10),
                        DropdownButton<People>(
                          value: mood.people,
                          hint: const Text("People"),
                          isExpanded: true,
                          items: People.menuItems,
                          onChanged: (val) {
                            setState(() {
                              if (val != null) mood.people = val;
                            });
                          },
                        ),
                        // DropdownMenu<People>(
                        //   requestFocusOnTap: true,
                        //   label: const Text("People"),
                        //   initialSelection: People.I,
                        //   onSelected: (People? who) {
                        //     if (who != null) {
                        //       current_mood.people = who;
                        //     }
                        //   },
                        //   dropdownMenuEntries: People.entries,
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  /// Happy
                  Text(
                    "Happy",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                  ),
                  MoodSlider(mood.happy.joy, label: const Text("Joy")),
                  MoodSlider(
                    mood.happy.confidence,
                    label: const Text("Confidence"),
                  ),
                  MoodSlider(
                    mood.happy.determination,
                    label: const Text("Determination"),
                  ),
                  MoodSlider(
                    mood.happy.fufillment,
                    label: const Text("Fufillment"),
                  ),
                  SizedBox(height: 16),

                  /// Sad
                  Text(
                    "Sad",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                  ),
                  MoodSlider(
                    mood.sad.disgust,
                    label: const Text("Disgust"),
                  ),
                  MoodSlider(
                    mood.sad.dissapointment,
                    label: const Text("Dissapointment"),
                  ),
                  MoodSlider(
                    mood.sad.stress,
                    label: const Text("Stress"),
                  ),
                  MoodSlider(mood.sad.worry, label: const Text("Worry")),
                  SizedBox(height: 16),

                  /// Notes
                  Column(
                    children: [
                      Text(
                        "Notes",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                      //SizedBox(
                      // height: 100,
                      Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, idx) {
                              return Slidable(
                                startActionPane: ActionPane(
                                  key: const ValueKey(0),
                                  extentRatio: SLIDABLE_EXTENT,
                                  motion: const ScrollMotion(),

                                  /// TODO: figure this out
                                  // dismissible: DismissiblePane(
                                  //   key: ValueKey(0),
                                  //   onDismissed: () {}),
                                  children: [
                                    SlidableAction(
                                      onPressed: (ctx) {
                                        showCancelableMessageBox(
                                          ctx,
                                          "Delete?",
                                          "Are you sure you want to delete this bullet?",
                                          onConfirm: () {
                                            setState(() {
                                              mood.notes.removeAt(idx);
                                            });
                                            showSnackBar(
                                              context,
                                              "NOOOOOOOOOOOOOOOOOOOOOOO (屮ﾟДﾟ)屮",
                                            );
                                          },
                                          onCancel: () {},
                                        );
                                      },
                                      icon: Icons.delete,
                                      backgroundColor: Colors.red,
                                      label: "delete",
                                    ),
                                    SlidableAction(
                                      flex: 3,
                                      onPressed: (ctx) {
                                        TextEditingController controller =
                                            TextEditingController();
                                        controller.text = mood.notes[idx];
                                        showEditDialogBox(
                                          ctx,
                                          "Edit",
                                          controller,
                                          () {
                                            setState(() {
                                              mood.notes[idx] =
                                                  controller.text;
                                            });
                                          },
                                        );
                                      },
                                      icon: Icons.edit,
                                      backgroundColor: Colors.yellow,
                                      label: "edit",
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  title: Text(mood.notes[idx]),
                                ),
                                // child: ConstrainedBox(
                                //   constraints: BoxConstraints(minHeight: 50),
                                //   child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Hello World")]),
                                // ),
                              );
                            },
                            itemCount: mood.notes.length,
                          ),

                          IconButton(
                            onPressed: () {
                              setState(() {
                                mood.notes.add("Slide to edit ➡");
                              });
                            },
                            icon: Icon(Icons.add),
                          ),

                          // TANG: Alfonzo >> Infinitly Sized Box >> ConstrainedBox => Default Constrains => Sized Box => Lines => †
                          SizedBox(height: 30),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
