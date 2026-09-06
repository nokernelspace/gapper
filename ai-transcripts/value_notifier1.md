# Value notifier for current_mood change in sheet

**Session ID:** ses_f895e4618ffehwGe8gaWbE8ixP
**Created:** 9/6/2026, 8:11:45 AM
**Updated:** 9/6/2026, 8:12:54 AM

---

## User

make no changes. mood_log.dart:34 what ot put int the closure to change the `current_modd` variable in mood_tab.dart:38. We are viewing the `MoodLog()` as a a sheet. make no changes. explain if we need a vluae notifier

---

## Assistant (Build · Big Pickle · 15.5s)

_Thinking:_

The user is asking about how to change the `current_mood` variable in `mood_tab.dart:38` from within a `MoodLog()` widget that's being viewed as a sheet. They specifically say "make no changes" so I should only analyze and explain.

Let me read the relevant files to understand the current state.

**Tool: read**

**Input:**
```json
{
  "filePath": "/Users/lyoko/Projects/flutter-projects/gapper/lib/mood_tab.dart"
}
```

**Error:**
```
File not found: /Users/lyoko/Projects/flutter-projects/gapper/lib/mood_tab.dart
```

**Tool: read**

**Input:**
```json
{
  "filePath": "/Users/lyoko/Projects/flutter-projects/gapper/lib/mood_log.dart"
}
```

**Error:**
```
File not found: /Users/lyoko/Projects/flutter-projects/gapper/lib/mood_log.dart
```

---

## Assistant (Build · Big Pickle · 3.3s)

_Thinking:_

Let me find the files.

**Tool: glob**

**Input:**
```json
{
  "pattern": "**/*mood*"
}
```

**Output:**
```
/Users/lyoko/Projects/flutter-projects/gapper/lib/widgets/mood_slider.dart
/Users/lyoko/Projects/flutter-projects/gapper/lib/widgets/mood_log.dart
/Users/lyoko/Projects/flutter-projects/gapper/lib/widgets/mood_toggle.dart
/Users/lyoko/Projects/flutter-projects/gapper/lib/data/mood.dart
/Users/lyoko/Projects/flutter-projects/gapper/lib/pages/tabs/mood_tab.dart
```

---

## Assistant (Build · Big Pickle · 21.7s)

**Tool: read**

**Input:**
```json
{
  "filePath": "/Users/lyoko/Projects/flutter-projects/gapper/lib/pages/tabs/mood_tab.dart"
}
```

**Output:**
```
<path>/Users/lyoko/Projects/flutter-projects/gapper/lib/pages/tabs/mood_tab.dart</path>
<type>file</type>
<content>
1: import 'package:flutter/material.dart';
2: import 'package:flutter_slidable/flutter_slidable.dart';
3: import 'package:gapper/data/mood.dart';
4: import 'package:gapper/utils.dart';
5: import 'package:gapper/widgets/dialogs.dart';
6: import 'package:gapper/widgets/mood_toggle.dart';
7: import 'package:gapper/widgets/mood_slider.dart';
8: import 'package:gapper/features.dart';
9: 
10: class MoodTab extends StatefulWidget {
11:   late _MoodTab state;
12:   Key? key;
13: 
14:   MoodTab(this.key);
15: 
16:   /// State
17:   @override
18:   // ignore: no_logic_in_create_state
19:   State<MoodTab> createState() {
20:     var state = _MoodTab(this.key);
21:     this.state = state;
22:     return state;
23:   }
24: }
25: 
26: class _MoodTab extends State<MoodTab> with AutomaticKeepAliveClientMixin {
27:   Key? key;
28:   _MoodTab(this.key);
29: 
30:   Mood current_mood = Mood();
31: 
32:   @override
33:   bool get wantKeepAlive => true;
34: 
35:   @override
36:   Widget build(BuildContext ctx) {
37:     super.build(ctx);
38: 
39:     return Scaffold(
40:       body: SizedBox(
41:         width: double.infinity,
42:         child: SingleChildScrollView(
43:           child: Column(
44:             //crossAxisAlignment: CrossAxisAlignment.start,
45:             children: [
46:               /// Modes
47:               Text(
48:                 "Modes",
49:                 style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
50:               ),
51: 
52:               Padding(
53:                 padding: EdgeInsetsGeometry.fromLTRB(75.0, 0.0, 75.0, 0.0),
54:                 child: Column(
55:                   children: [
56:                     MoodToggle(
57:                       current_mood.modes.learning,
58:                       label: const Text(" Learning"),
59:                     ),
60:                     MoodToggle(
61:                       current_mood.modes.physical,
62:                       label: const Text(" Physical"),
63:                     ),
64:                     MoodToggle(
65:                       current_mood.modes.relax,
66:                       label: const Text("   Relax  "),
67:                     ),
68:                     MoodToggle(
69:                       current_mood.modes.working,
70:                       label: const Text(" Working"),
71:                     ),
72:                     SizedBox(height: 10),
73:                     DropdownButton<People>(
74:                       value: current_mood.people,
75:                       hint: const Text("People"),
76:                       isExpanded: true,
77:                       items: People.menuItems,
78:                       onChanged: (val) {
79:                         setState(() {
80:                           if (val != null)
81:                             current_mood.people = val;
82:                         });
83:                       },
84:                     ),
85:                     // DropdownMenu<People>(
86:                     //   requestFocusOnTap: true,
87:                     //   label: const Text("People"),
88:                     //   initialSelection: People.I,
89:                     //   onSelected: (People? who) {
90:                     //     if (who != null) {
91:                     //       current_mood.people = who;
92:                     //     }
93:                     //   },
94:                     //   dropdownMenuEntries: People.entries,
95:                     // ),
96:                   ],
97:                 ),
98:               ),
99:               SizedBox(height: 16),
100: 
101:               /// Happy
102:               Text(
103:                 "Happy",
104:                 style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
105:               ),
106:               MoodSlider(current_mood.happy.joy, label: const Text("Joy")),
107:               MoodSlider(
108:                 current_mood.happy.confidence,
109:                 label: const Text("Confidence"),
110:               ),
111:               MoodSlider(
112:                 current_mood.happy.determination,
113:                 label: const Text("Determination"),
114:               ),
115:               MoodSlider(
116:                 current_mood.happy.fufillment,
117:                 label: const Text("Fufillment"),
118:               ),
119:               SizedBox(height: 16),
120: 
121:               /// Sad
122:               Text(
123:                 "Sad",
124:                 style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
125:               ),
126:               MoodSlider(
127:                 current_mood.sad.disgust,
128:                 label: const Text("Disgust"),
129:               ),
130:               MoodSlider(
131:                 current_mood.sad.dissapointment,
132:                 label: const Text("Dissapointment"),
133:               ),
134:               MoodSlider(current_mood.sad.stress, label: const Text("Stress")),
135:               MoodSlider(current_mood.sad.worry, label: const Text("Worry")),
136:               SizedBox(height: 16),
137: 
138:               /// Notes
139:               Column(
140:                 children: [
141:                   Text(
142:                     "Notes",
143:                     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
144:                   ),
145:                   //SizedBox(
146:                   // height: 100,
147:                   Column(
148:                     children: [
149:                       ListView.builder(
150:                         shrinkWrap: true,
151:                         physics: NeverScrollableScrollPhysics(),
152:                         itemBuilder: (ctx, idx) {
153:                           return Slidable(
154:                             startActionPane: ActionPane(
155:                               key: const ValueKey(0),
156:                               extentRatio: SLIDABLE_EXTENT,
157:                               motion: const ScrollMotion(),
158: 
159:                               /// TODO: figure this out
160:                               // dismissible: DismissiblePane(
161:                               //   key: ValueKey(0),
162:                               //   onDismissed: () {}),
163:                               children: [
164:                                 SlidableAction(
165:                                   onPressed: (ctx) {
166:                                     showCancelableMessageBox(
167:                                       ctx,
168:                                       "Delete?",
169:                                       "Are you sure you want to delete this bullet?",
170:                                       onConfirm: () {
171:                                         setState(() {
172:                                           current_mood.notes.removeAt(idx);
173:                                         });
174:                                         showSnackBar(
175:                                           context,
176:                                           "NOOOOOOOOOOOOOOOOOOOOOOO (屮ﾟДﾟ)屮",
177:                                         );
178:                                       },
179:                                       onCancel: () {},
180:                                     );
181:                                   },
182:                                   icon: Icons.delete,
183:                                   backgroundColor: Colors.red,
184:                                   label: "delete",
185:                                 ),
186:                                 SlidableAction(
187:                                   flex: 3,
188:                                   onPressed: (ctx) {
189:                                     TextEditingController controller =
190:                                         TextEditingController();
191:                                     controller.text = current_mood.notes[idx];
192:                                     showEditDialogBox(
193:                                       ctx,
194:                                       "Edit",
195:                                       controller,
196:                                       () {
197:                                         setState(() {
198:                                           current_mood.notes[idx] =
199:                                               controller.text;
200:                                         });
201:                                       },
202:                                     );
203:                                   },
204:                                   icon: Icons.edit,
205:                                   backgroundColor: Colors.yellow,
206:                                   label: "edit",
207:                                 ),
208:                               ],
209:                             ),
210:                             child: ListTile(
211:                               title: Text(current_mood.notes[idx]),
212:                             ),
213:                             // child: ConstrainedBox(
214:                             //   constraints: BoxConstraints(minHeight: 50),
215:                             //   child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Hello World")]),
216:                             // ),
217:                           );
218:                         },
219:                         itemCount: current_mood.notes.length,
220:                       ),
221: 
222:                       IconButton(
223:                         onPressed: () {
224:                           setState(() {
225:                             current_mood.notes.add("Slide to edit ➡");
226:                           });
227:                         },
228:                         icon: Icon(Icons.add),
229:                       ),
230: 
231:                       // TANG: Alfonzo >> Infinitly Sized Box >> ConstrainedBox => Default Constrains => Sized Box => Lines => †
232:                       SizedBox(height: 30),
233:                     ],
234:                   ),
235:                 ],
236:               ),
237:             ],
238:           ),
239:         ),
240:       ),
241:     );
242:   }
243: }

(End of file - total 243 lines)
</content>
```

**Tool: read**

**Input:**
```json
{
  "filePath": "/Users/lyoko/Projects/flutter-projects/gapper/lib/widgets/mood_log.dart",
  "limit": 60
}
```

**Output:**
```
<path>/Users/lyoko/Projects/flutter-projects/gapper/lib/widgets/mood_log.dart</path>
<type>file</type>
<content>
1: import 'package:flutter/material.dart';
2: import 'package:gapper/data/mood.dart';
3: 
4: class MoodLog extends StatelessWidget {
5:   List<Mood> moods;
6:   MoodLog(this.moods, {super.key});
7: 
8:   @override
9:   Widget build(BuildContext ctx) {
10:     // group moods by day so we can have neet little sections when scrolling through logged moods
11:     Map<DateTime, List<Mood>> day_map = Map();
12:     for (Mood mood in moods) {
13:       var date = DateTime(mood.time.year, mood.time.month, mood.time.day);
14:       if (!day_map.containsKey(date)) {
15:         day_map[date] = List.empty(growable: true);
16:       }
17:       var day_entry = day_map[date]!;
18:       day_entry.add(mood);
19:     }
20: 
21:     return Column(
22:       children: [
23:         ListView.separated(
24:           shrinkWrap: true,
25:           padding: const EdgeInsets.all(8),
26:           itemCount: moods.length,
27:           itemBuilder: (BuildContext ctx, int idx) {
28:             var mood = moods[idx]!;
29: 
30:             return ListTile(
31:               key: key, 
32:               title: Text(mood.people.name),
33:               onTap: () {
34:                 
35:               }
36:             );
37:           },
38:           separatorBuilder: (BuildContext ctx, int idx) {
39:             return const SizedBox(height: 1.0, width: double.infinity);
40:           },
41:         ),
42:       ],
43:     );
44:   }
45: }

(End of file - total 45 lines)
</content>
```

---

## Assistant (Build · Big Pickle · 2.7s)

Let me look at the `Mood` class to understand the data.



**Tool: read**

**Input:**
```json
{
  "filePath": "/Users/lyoko/Projects/flutter-projects/gapper/lib/data/mood.dart",
  "limit": 60
}
```

**Output:**
```
<path>/Users/lyoko/Projects/flutter-projects/gapper/lib/data/mood.dart</path>
<type>file</type>
<content>
1: import 'dart:convert';
2: 
3: import 'package:flutter/material.dart';
4: 
5: import 'dart:developer' as developer;
6: 
7: typedef Bullet = String;
8: 
9: class Mood {
10:   DateTime time = DateTime.now();
11:   List<Bullet> notes = List.from([]);
12: 
13:   /// Equivalent to List.empty(growable: true)
14: 
15:   Modes modes = Modes();
16:   Happy happy = Happy();
17:   Sad sad = Sad();
18:   People people = People.I;
19: 
20:   Mood();
21:   Mood.from(this.modes, this.happy, this.sad, this.people, this.notes);
22: 
23:   dynamic toJson() => {
24:     'modes': modes.toJson(),
25:     'happy': happy.toJson(),
26:     'sad': sad.toJson(),
27:     'people': people.toJson(),
28:     'notes': notes.map((x) => x).toList(),
29:   };
30: 
31:   static Mood fromJson(Map<String, dynamic> json) {
32:     return Mood.from(
33:       Modes.fromJson(json["modes"]),
34:       Happy.fromJson(json["happy"]),
35:       Sad.fromJson(json["sad"]),
36:       People.fromJson(json["people"]),
37:       List<Bullet>.from(json["notes"].map((x) {return x as Bullet;})),
38:     );
39:   }
40: }
41: 
42: enum People {
43:   FRIENDS,
44:   FAMILY,
45:   I;
46: 
47:   /// NOTE: the list
48:   dynamic toJson() => this.name;
49:   static People fromJson(String people) {
50:     return People.values.byName(people);
51:   }
52:   static List<DropdownMenuEntry<People>> menuEntries = () {
53:     List<DropdownMenuEntry<People>> out = List.empty(growable: true);
54:     for (var v in People.values) {
55:       out.add(DropdownMenuEntry(value: v, label: v.name));
56:     }
57:     return out;
58:   }();
59: 
60:   static List<DropdownMenuItem<People>> menuItems = () {

(Showing lines 1-60 of 145. Use offset=61 to continue.)
</content>
```

---

## Assistant (Build · Big Pickle · 5.1s)

Now let me find where `MoodLog` is used, to see how it's set up as a sheet and where `current_mood` lives in relation.



**Tool: grep**

**Input:**
```json
{
  "pattern": "MoodLog"
}
```

**Output:**
```
Found 14 matches
/Users/lyoko/Projects/flutter-projects/gapper/ai-transcripts/silly1.md:
  Line 157: 85:                             child: MoodLog(moods),

  Line 287:   Line 4: class MoodLog extends StatelessWidget{


/Users/lyoko/Projects/flutter-projects/gapper/lib/widgets/mood_log.dart:
  Line 4: class MoodLog extends StatelessWidget {

  Line 6:   MoodLog(this.moods, {super.key});


/Users/lyoko/Projects/flutter-projects/gapper/ai-transcripts/dart_weird_async.md:
  Line 939: 71:             return MoodLog();

  Line 1002: The user is asking for advice on where to load moods from the filesystem. Let me look at the `mood_log.dart` widget - `LogView` takes moods as a parameter, and in `start.dart` the `showBottomSheet` uses `MoodLog()` without moods. There's a `MoodLog` class referenced in mood_log.dart but I only saw `LogView`. Let me re-read the file... Actually the file defines `LogView` but start.dart references `MoodLog()`. Wait, maybe there's a `MoodLog` widget somewhere. Let me search.

  Line 1010:   "pattern": "MoodLog|LogView"

  Line 1024:   Line 71:             return MoodLog();

  Line 1034: So `MoodLog()` is referenced in start.dart:71 but doesn't exist - there's only `LogView`. That's a bug. Let me check where "moods" are loaded. Currently `_StartPage` has `late List<Mood> moods;` but never assigns it, and `sortedList()` is called but the result is discarded at start.dart:94.

  Line 1048: So the answer: populate `moods` in `_StartPage` (e.g., in `initState`) by calling `Filesystem.collection("moods").sortedList()` and pass it to `LogView`, rather than the current throwaway call on save. Also the bottom sheet uses non-existent `MoodLog()` which should presumably be `LogView(moods)`.

  Line 1052: Answer: The loading logic already exists as `Collection.sortedList()` (globals.dart:69). Load it in the `_StartPage` state via `initState` into the unused `moods` field (start.dart:22), and pass to `LogView`. Right now line 94 calls sortedList() but throws away the result. Also MoodLog() in the bottom sheet doesn't exist — LogView is the widget.

  Line 1058: Right now start.dart:94 calls `sortedList()` but discards the result, and the bottom sheet references `MoodLog()` (start.dart:71) which doesn't exist — the widget is `LogView`. So:

  Line 1061: - Pass `moods` to `LogView(moods)` instead of `MoodLog()`.


/Users/lyoko/Projects/flutter-projects/gapper/lib/pages/frames/start.dart:
  Line 87:                             child: MoodLog(moods),

```

---

## Assistant (Build · Big Pickle · 1.4s)

**Tool: read**

**Input:**
```json
{
  "filePath": "/Users/lyoko/Projects/flutter-projects/gapper/lib/pages/frames/start.dart"
}
```

**Output:**
```
<path>/Users/lyoko/Projects/flutter-projects/gapper/lib/pages/frames/start.dart</path>
<type>file</type>
<content>
1: import 'package:flutter/material.dart';
2: import 'package:gapper/pages/tabs/chats_tab.dart';
3: import 'package:gapper/pages/tabs/log_tab.dart';
4: import 'package:gapper/pages/tabs/mood_tab.dart';
5: import 'package:gapper/pages/tabs/notebooks_tab.dart';
6: import 'package:gapper/features.dart';
7: import 'package:gapper/utils.dart';
8: import 'package:gapper/globals.dart';
9: import 'package:gapper/data/mood.dart';
10: import 'package:gapper/widgets/mood_log.dart';
11: 
12: import 'dart:async';
13: 
14: class StartPage extends StatefulWidget {
15:   const StartPage({super.key});
16: 
17:   @override
18:   State<StartPage> createState() => _StartPage();
19: }
20: 
21: class _StartPage extends State<StartPage> {
22:   int current_idx = 0;
23:   late PageController page_controller;
24: 
25:   _StartPage() {
26:     page_controller = PageController(initialPage: current_idx);
27:   }
28: 
29:   @override
30:   Widget build(BuildContext context) {
31:     // First 2 are default tabs, last 2 are GEMINI enabled tabs
32:     List<BottomNavigationBarItem> tab_items = [
33:       BottomNavigationBarItem(icon: Icon(Icons.mood), label: "Mood"),
34:     ];
35:     () {
36:       if (GEMINI_ENABLED) {
37:         tab_items.add(
38:           BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
39:         );
40:         tab_items.add(
41:           BottomNavigationBarItem(icon: Icon(Icons.note), label: "Notebooks"),
42:         );
43:       }
44: 
45:       if (!VIEW_LOG_AS_SHEET) {
46:         tab_items.add(
47:           BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "Log"),
48:         );
49:       }
50:     }();
51: 
52:     List<Widget> tab_frames = [MoodTab(widget.key)];
53:     () {
54:       if (GEMINI_ENABLED) {
55:         tab_frames.add(ChatsTab());
56:         tab_frames.add(NotebooksTab());
57:       }
58: 
59:       if (!VIEW_LOG_AS_SHEET) {
60:         tab_frames.add(LogTab());
61:       }
62:     }();
63:     // var mood_tab = (tab_frames[0] as MoodTab);
64:     // mood_tab.state.current_mood.toString();
65: 
66:     ValueNotifier<Mood> mood = ValueNotifier(Mood());
67:     var now = DateTime.now();
68: 
69:     return Scaffold(
70:       appBar: AppBar(
71:         leading: VIEW_LOG_AS_SHEET
72:             ? Builder(
73:                 builder: (context) {
74:                   return IconButton(
75:                     icon: Icon(Icons.newspaper),
76:                     onPressed: () {
77:                       var moods = Filesystem.collection("moods")
78:                           .sortedListSync();
79:                       showModalBottomSheet(
80:                         isScrollControlled: true,
81:                         showDragHandle: true,
82:                         enableDrag: true,
83:                         context: context,
84:                         builder: (BuildContext context) {
85:                           return FractionallySizedBox(
86:                             heightFactor: 0.85,
87:                             child: MoodLog(moods),
88:                           );
89:                         },
90:                       );
91:                     },
92:                   );
93:                 },
94:               )
95:             : null,
96:         title: MaterialButton(
97:           child: Text(
98:             now.month.toString() +
99:                 "-" +
100:                 now.day.toString() +
101:                 "-" +
102:                 now.year.toString(),
103: 
104:                 style: const TextStyle(
105:                   fontSize: 21,
106:                   fontWeight: FontWeight.w500
107:                 ),
108:           ),
109:           onPressed: () {},
110:         ),
111:         actions: [
112:           IconButton(icon: Icon(Icons.add), onPressed: () {}),
113: 
114:           IconButton(icon: Icon(Icons.copy), onPressed: () {}),
115: 
116:           IconButton(
117:             icon: Icon(Icons.save),
118:             onPressed: () async {
119:               // TODO: HACKY FIX
120:               // Reading state on Press which is why we can do this
121:               if (FIREBASE_ENABLED) {
122:                 db.collection("moods").add(mood.value.toJson());
123:               } else if (OFFLINE) {
124:                 await Filesystem.collection("moods").add(
125:                   mood.value.toJson(),
126:                   // Need filename because we are not a datastore. Yet (•͡˘㇁•͡˘)
127:                   sanitizeFilename(mood.value.time.toString()) + ".mood",
128:                 );
129: 
130:                 //await Filesystem.collection("moods").sortedList();
131:               }
132:               showSnackBar(context, "Saved!");
133:             },
134:           ),
135:         ],
136:       ),
137:       body: Padding(
138:         child: PageView(children: tab_frames, controller: page_controller),
139:         padding: EdgeInsetsGeometry.fromLTRB(10, 0, 10, 0),
140:       ),
141:       bottomNavigationBar: !VIEW_LOG_AS_SHEET
142:           ? BottomNavigationBar(
143:               currentIndex: current_idx,
144:               onTap: (_idx) {
145:                 setState(() {
146:                   current_idx = _idx;
147:                   page_controller.jumpToPage(current_idx);
148:                 });
149:               },
150:               type: BottomNavigationBarType.fixed,
151:               items: tab_items,
152:             )
153:           : null,
154:     );
155:   }
156: }

(End of file - total 156 lines)
</content>
```

---

## Assistant (Build · Big Pickle · 19.6s)

Now I understand the architecture. Let me explain.

The `MoodLog` shows a list of saved moods. When you tap one (mood_log.dart:34's `onTap`), you want that tap to change `current_mood` in `_MoodTab` (mood_tab.dart:30), and presumably close the sheet.

The clarification is important: **`MoodLog` does not have access to `_MoodTab`'s `current_mood` directly.** `current_mood` is just an instance field on `_MoodTab` state, there's no shared reference.

Two things to distinguish:

**1. What the closure needs to hold:** The key issue is `mood_tab.dart:38` (your reference; the `current_mood` field is at line 30, used in `build` throughout). The `MoodLog` for the log sheet is built in `start.dart`, and it currently receives `moods` (the saved list) — not `_MoodTab`'s state. So the closure in mood_log.dart:34 would be:

```dart
onTap: () {
  // what goes here
}
```

To change the *living* `current_mood` in the tab, `MoodLog` must be given a callback that `_MoodTab` provides. Concretely, you'd add a parameter to `MoodLog`, e.g. `MoodLog(this.moods, {this.onMoodTap, ...})`, and the tab registers a callback that does `setState(() => current_mood = mood)`. But that thread doesn't currently exist — `MoodLog` is created in `start.dart`, not handed the tab's state.

**2. Do you need a ValueNotifier? — No (with one caveat).**

You already have a **mutable `Mood` object** (`current_mood`, mood_tab.dart:30) whose *contents* are mutated in place via `setState`. So for editing the fields of the currently-loaded mood, you don't need a notifier — you just need to load the tapped mood's data into that same object and call `setState`:

```dart
onTap: () {
  setState(() {
    current_mood = moods[idx];
  });
}
```

That replaces the whole `Mood` reference and triggers a rebuild, which is consistent with how the rest of the tab already works.

A `ValueNotifier<Mood>` would only be warranted if you decouple the state from `_MoodTab` and want the log sheet (or other widgets) to *observe* changes reactively — e.g. passing the notifier down so `MoodLog` can `set` it. Given `current_mood` is a cheap mutable object already rebuilt with `setState`, the idiomatic Flutter approach is **no notifier** — just a callback that assigns the tapped mood and calls `setState`.

So the summary:
- Closure needs: assignment to `current_mood` inside `setState`, but `MoodLog` currently has no access to it — you must thread a callback/`onTap` from `_MoodTab` into `MoodLog` (currently constructed in start.dart, which doesn't hold the tab state either).
- Notifier: not required; `current_mood` is a mutable object already manipulated with `setState`. Only add a `ValueNotifier` if you want shared, externally-observable state.

---

