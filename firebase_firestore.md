# Firestore Flutter example

**Session ID:** ses_f96ae8812ffeJDZRlbH3jM3Xbj
**Created:** 9/3/2026, 6:09:01 PM
**Updated:** 9/3/2026, 7:34:11 PM

---

## User

firestore flutter example. make no changes

---

## Assistant (Build · Big Pickle · 9.6s)

I'll research the codebase to understand the Firestore setup, but make no changes as requested.



**Tool: bash**

**Input:**
```json
{
  "command": "ls -la && cat pubspec.yaml 2>/dev/null | head -60"
}
```

**Output:**
```
total 192
drwxr-xr-x@ 27 lyoko  staff    864 Sep  3 18:08 .
drwxr-xr-x@  8 lyoko  staff    256 Aug 31 18:02 ..
drwxr-xr-x   3 lyoko  staff     96 Sep  1 10:32 .artifacts
drwxr-xr-x   8 lyoko  staff    256 Sep  2 16:58 .dart_tool
-rw-r--r--   1 lyoko  staff   8196 Sep  3 05:54 .DS_Store
-rw-r--r--@  1 lyoko  staff     59 Sep  3 18:08 .firebaserc
-rw-r--r--   1 lyoko  staff   9693 Aug 31 19:53 .flutter-plugins-dependencies
drwxr-xr-x  15 lyoko  staff    480 Sep  3 08:59 .git
-rw-r--r--   1 lyoko  staff    759 Aug 31 21:40 .gitignore
drwxr-xr-x  13 lyoko  staff    416 Sep  3 16:30 .idea
-rw-r--r--   1 lyoko  staff   1114 Aug 31 18:02 .metadata
drwxr-xr-x   3 lyoko  staff     96 Sep  3 07:17 .vscode
drwxr-xr-x  14 lyoko  staff    448 Sep  3 07:32 .widget_preview
-rw-r--r--   1 lyoko  staff   1547 Aug 31 18:02 analysis_options.yaml
drwxr-xr-x  14 lyoko  staff    448 Aug 31 19:25 android
drwxr-xr-x@ 17 lyoko  staff    544 Sep  3 07:30 build
-rw-r--r--   1 lyoko  staff    184 Sep  2 16:58 devtools_options.yaml
-rw-r--r--@  1 lyoko  staff   1135 Sep  3 18:08 firebase.json
-rw-r--r--@  1 lyoko  staff   1238 Sep  3 18:08 firestore.indexes.json
-rw-r--r--@  1 lyoko  staff    731 Sep  3 18:08 firestore.rules
-rw-r--r--   1 lyoko  staff    692 Aug 31 18:05 gapper.iml
drwxr-xr-x   8 lyoko  staff    256 Aug 31 18:02 ios
drwxr-xr-x  13 lyoko  staff    416 Sep  3 16:12 lib
-rw-r--r--   1 lyoko  staff  22180 Sep  3 07:17 pubspec.lock
-rw-r--r--   1 lyoko  staff   4328 Sep  2 08:58 pubspec.yaml
-rw-r--r--   1 lyoko  staff    624 Aug 31 18:02 README.md
drwxr-xr-x   3 lyoko  staff     96 Sep  2 16:53 test
name: gapper
description: "Gemini API Wrapper"
# The following line prevents the package from being accidentally published to
# pub.dev using `flutter pub publish`. This is preferred for private packages.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number is used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
# In Windows, build-name is used as the major, minor, and patch parts
# of the product and file versions while build-number is used as the build suffix.
version: 1.0.0+1

environment:
  sdk: ^3.13.0

# Dependencies specify other packages that your package needs in order to work.
# To automatically upgrade your package dependencies to the latest versions
# consider running `flutter pub upgrade --major-versions`. Alternatively,
# dependencies can be manually updated by changing the version numbers below to
# the latest version available on pub.dev. To see which dependencies have newer
# versions available, run `flutter pub outdated`.
dependencies:
  flutter:
    sdk: flutter

  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.8

  # FIREBASEEEEEEEEEE
  firebase_auth: ^6.6.1
  firebase_core: ^4.14.0

  google_sign_in: ^7.2.0 # Requires GMS (Android only)

  # Storage packages
  flutter_secure_storage: ^10.0.0 # Store stuff in device crypto chain chip
  shared_preferences: ^2.5.5      # Simple KV store for settings
  path_provider: ^2.1.6           # application paths (Cross-platform)

  url_launcher: ^6.3.2            # Cross-platform URL launcher

  smooth_page_indicator: ^1.2.0   # For the little dots for PageViews

dev_dependencies:
  flutter_test:
    sdk: flutter

  # The "flutter_lints" package below contains a set of recommended lints to
  # encourage good coding practices. The lint set provided by the package is
  # activated in the `analysis_options.yaml` file located at the root of your
  # package. See that file for information about deactivating specific lint

```

**Tool: glob**

**Input:**
```json
{
  "pattern": "**/*firestore*"
}
```

**Output:**
```
/Users/lyoko/Projects/flutter-projects/gapper/firestore.indexes.json
/Users/lyoko/Projects/flutter-projects/gapper/firestore.rules
```

---

## Assistant (Build · Big Pickle · 2.2s)

I see the project has Firebase Auth and Core but no Firestore dependency yet. Let me look at how Firebase is currently used in the codebase.



**Tool: grep**

**Input:**
```json
{
  "pattern": "firebase|Firebase|Firestore",
  "include": "*.dart"
}
```

**Output:**
```
Found 35 matches
/Users/lyoko/Projects/flutter-projects/gapper/lib/main.dart:
  Line 11: import 'package:firebase_auth/firebase_auth.dart';

  Line 12: import 'package:firebase_core/firebase_core.dart';

  Line 18:   print("Running with Firebase Enabled :  ${FIREBASE_ENABLED}");

  Line 28:     await Firebase.initializeApp();

  Line 32:       /// Start dev auth instance with `firebase emulators:start --only auth,`

  Line 33:       await FirebaseAuth.instance.useAuthEmulator("localhost", 9099);

  Line 46:   // FirebaseAuth.instance


/Users/lyoko/Projects/flutter-projects/gapper/lib/noice/noice.dart:
  Line 13: /// Firebase Features


/Users/lyoko/Projects/flutter-projects/gapper/lib/firebase_options.dart:
  Line 3: import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

  Line 7: /// Default [FirebaseOptions] for use with your Firebase apps.

  Line 11: /// import 'firebase_options.dart';

  Line 13: /// await Firebase.initializeApp(

  Line 14: ///   options: DefaultFirebaseOptions.currentPlatform,

  Line 17: class DefaultFirebaseOptions {

  Line 18:   static FirebaseOptions get currentPlatform {

  Line 21:         'DefaultFirebaseOptions have not been configured for web - '

  Line 32:           'DefaultFirebaseOptions have not been configured for macos - '

  Line 37:           'DefaultFirebaseOptions have not been configured for windows - '

  Line 42:           'DefaultFirebaseOptions have not been configured for linux - '

  Line 47:           'DefaultFirebaseOptions are not supported for this platform.',

  Line 52:   static const FirebaseOptions android = FirebaseOptions(

  Line 57:     storageBucket: 'eepy-technologies.firebasestorage.app',

  Line 60:   static const FirebaseOptions ios = FirebaseOptions(

  Line 65:     storageBucket: 'eepy-technologies.firebasestorage.app',


/Users/lyoko/Projects/flutter-projects/gapper/lib/features.dart:
  Line 11:   // Noice depends on Firebase

  Line 12:   // Firebase does not depend on NoIce

  Line 14:     print("NoIce can only be enabled with Firebase enabled");

  Line 19:     print("Cannot run in offline mode with Firebase and Gemini");


/Users/lyoko/Projects/flutter-projects/gapper/lib/wrappers/gemini.dart:
  Line 2: import 'package:firebase_auth/firebase_auth.dart';

  Line 3: import 'package:firebase_core/firebase_core.dart';

  Line 20:   return await FirebaseAuth.instance.signInWithCredential(credential);


/Users/lyoko/Projects/flutter-projects/gapper/lib/pages/frames/setup/login.dart:
  Line 6: import 'package:firebase_auth/firebase_auth.dart';

  Line 38:   final FirebaseAuth auth = FirebaseAuth.instance;

  Line 53:     } on FirebaseAuthException catch (e) {

  Line 72:     } on FirebaseAuthException catch (e) {

```

**Tool: read**

**Input:**
```json
{
  "filePath": "/Users/lyoko/Projects/flutter-projects/gapper/firestore.rules"
}
```

**Output:**
```
<path>/Users/lyoko/Projects/flutter-projects/gapper/firestore.rules</path>
<type>file</type>
<content>
1: rules_version='2'
2: 
3: service cloud.firestore {
4:   match /databases/{database}/documents {
5:     match /{document=**} {
6:       // This rule allows anyone with your database reference to view, edit,
7:       // and delete all data in your database. It is useful for getting
8:       // started, but it is configured to expire after 30 days because it
9:       // leaves your app open to attackers. At that time, all client
10:       // requests to your database will be denied.
11:       //
12:       // Make sure to write security rules for your app before that time, or
13:       // else all client requests to your database will be denied until you
14:       // update your rules.
15:       allow read, write: if request.time < timestamp.date(2026, 10, 3);
16:     }
17:   }
18: }

(End of file - total 18 lines)
</content>
```

**Tool: read**

**Input:**
```json
{
  "filePath": "/Users/lyoko/Projects/flutter-projects/gapper/firestore.indexes.json"
}
```

**Output:**
```
<path>/Users/lyoko/Projects/flutter-projects/gapper/firestore.indexes.json</path>
<type>file</type>
<content>
1: {
2:   // Example (Standard Edition):
3:   //
4:   // "indexes": [
5:   //   {
6:   //     "collectionGroup": "widgets",
7:   //     "queryScope": "COLLECTION",
8:   //     "fields": [
9:   //       { "fieldPath": "foo", "arrayConfig": "CONTAINS" },
10:   //       { "fieldPath": "bar", "mode": "DESCENDING" }
11:   //     ]
12:   //   },
13:   //
14:   //  "fieldOverrides": [
15:   //    {
16:   //      "collectionGroup": "widgets",
17:   //      "fieldPath": "baz",
18:   //      "indexes": [
19:   //        { "order": "ASCENDING", "queryScope": "COLLECTION" }
20:   //      ]
21:   //    },
22:   //   ]
23:   // ]
24:   //
25:   // Example (Enterprise Edition):
26:   //
27:   // "indexes": [
28:   //   {
29:   //     "collectionGroup": "reviews",
30:   //     "queryScope": "COLLECTION_GROUP",
31:   //     "apiScope": "MONGODB_COMPATIBLE_API",
32:   //     "density": "DENSE",
33:   //     "multikey": false,
34:   //     "fields": [
35:   //       { "fieldPath": "baz", "mode": "ASCENDING" }
36:   //     ]
37:   //   },
38:   //   {
39:   //     "collectionGroup": "items",
40:   //     "queryScope": "COLLECTION_GROUP",
41:   //     "apiScope": "MONGODB_COMPATIBLE_API",
42:   //     "density": "SPARSE_ANY",
43:   //     "multikey": true,
44:   //     "fields": [
45:   //       { "fieldPath": "baz", "mode": "ASCENDING" }
46:   //     ]
47:   //   },
48:   // ]
49:   "indexes": [],
50:   "fieldOverrides": []
51: }

(End of file - total 51 lines)
</content>
```

---

## Assistant (Build · Big Pickle · 2.9s)

The project is set up for Firebase (Auth + Core) but Firestore is **not yet wired up** in code. Let me look at the relevant code structure to understand how Firebase is initialized and how the existing features work.



**Tool: read**

**Input:**
```json
{
  "filePath": "/Users/lyoko/Projects/flutter-projects/gapper/lib/main.dart"
}
```

**Output:**
```
<path>/Users/lyoko/Projects/flutter-projects/gapper/lib/main.dart</path>
<type>file</type>
<content>
1: import 'package:gapper/pages/frames/setup.dart';
2: import 'app.dart';
3: 
4: import 'features.dart';   /// List of booleans for toggling features
5: import 'globals.dart';    /// List of global variable. View definition for more details
6: 
7: import 'wrappers/gemini.dart';
8: 
9: import 'package:shared_preferences/shared_preferences.dart';
10: import 'package:flutter/material.dart';
11: import 'package:firebase_auth/firebase_auth.dart';
12: import 'package:firebase_core/firebase_core.dart';
13: import 'package:flutter/foundation.dart';
14: import 'package:gapper/pages/frames/setup/gemini_key.dart';
15: 
16: 
17: Future<void> main() async {
18:   print("Running with Firebase Enabled :  ${FIREBASE_ENABLED}");
19:   print("Running with NoIce Enabled :     ${OFFLINE}");
20:   print("Running with Gemini Enabled :    ${GEMINI_ENABLED}");
21: 
22:   print("Running in offline mode :        ${OFFLINE}");
23:   assertFeatures();
24: 
25:   WidgetsFlutterBinding.ensureInitialized();
26: 
27:   if (FIREBASE_ENABLED){
28:     await Firebase.initializeApp();
29: 
30:     /// If `flutter run` without `--release`
31:     if (kDebugMode) {
32:       /// Start dev auth instance with `firebase emulators:start --only auth,`
33:       await FirebaseAuth.instance.useAuthEmulator("localhost", 9099);
34:     }
35:   }
36: 
37:   /// `SharedPreferences` is a simple persistant key value store
38:   //   Example Below
39:   final settings = await SharedPreferences.getInstance();
40:   final String? gemini_api_key = await settings.getString("GEMINI_API_KEY");
41:   ShouldBeSecureKeys.GEMINI_API_KEY = gemini_api_key;
42: 
43: 
44: 
45:   // TODO: paste this somewhere
46:   // FirebaseAuth.instance
47:   //     .authStateChanges()
48:   //     .listen((User? user) {
49:   //   if (user == null)
50:   //     print("User is currently signed out!");
51:   //   else
52:   //     print("User is signed in (${user.email})");
53:   //
54:   // });
55: 
56: 
57:   runApp(App(api_key: gemini_api_key));
58: }
59: 
60: 
61: bool is_asking_for_gemini_key = false;
62: 
63: Future<void> askForGeminiKey() async {
64:   if (GEMINI_ENABLED) {
65:     if (!is_asking_for_gemini_key) {
66:       if (AppState.NAVKEY.currentState != null) {
67:         await Future.delayed(const Duration(seconds: 1));
68:         AppState.NAVKEY.currentState!.push(
69:             MaterialPageRoute(builder: (context) => GeminiKeyFrame())
70:         );
71:         is_asking_for_gemini_key = true;
72:       }
73:     }
74:   }
75: }
76: 
77: 
78: 
79: 

(End of file - total 79 lines)
</content>
```

**Tool: read**

**Input:**
```json
{
  "filePath": "/Users/lyoko/Projects/flutter-projects/gapper/lib/features.dart"
}
```

**Output:**
```
<path>/Users/lyoko/Projects/flutter-projects/gapper/lib/features.dart</path>
<type>file</type>
<content>
1: import 'dart:io';
2: 
3: const GEMINI_ENABLED = false;
4: const FIREBASE_ENABLED = false;
5: const NOICE_ENABLED = false;
6: const OFFLINE = true;
7: 
8: /// Assert that certain features are enabled
9: /// "There is a time and place to do that, but not now" ~Professor Oak
10: void assertFeatures() {
11:   // Noice depends on Firebase
12:   // Firebase does not depend on NoIce
13:   if (NOICE_ENABLED && !FIREBASE_ENABLED) {
14:     print("NoIce can only be enabled with Firebase enabled");
15:     exit(1);
16:   }
17: 
18:   if (OFFLINE && (FIREBASE_ENABLED || GEMINI_ENABLED)) {
19:     print("Cannot run in offline mode with Firebase and Gemini");
20:     exit(1);
21:   }
22: }

(End of file - total 22 lines)
</content>
```

**Tool: read**

**Input:**
```json
{
  "filePath": "/Users/lyoko/Projects/flutter-projects/gapper/lib/noice/noice.dart"
}
```

**Output:**
```
<path>/Users/lyoko/Projects/flutter-projects/gapper/lib/noice/noice.dart</path>
<type>file</type>
<content>
1: class NoIce {
2: 
3:   NoIceApp initializeApp() {
4:     return NoIceApp();
5:   }
6: }
7: 
8: class NoIceApp {
9: 
10: }
11: 
12: 
13: /// Firebase Features
14: class NoIceAuth {
15:   static final instance = NoIceAuth();
16: 
17:   void useAuthEmulator(String host, int port) {
18:     return null;
19:   }
20: 
21:   // Future<void> signInWithEmailAndPassword({required String email, required String password}) {
22: 
23:   // }
24: 
25: 
26:   // Future<void> createUserWithEmailAndPassword({required String email, required String password}) {
27: 
28:   // }
29: }

(End of file - total 29 lines)
</content>
```

**Tool: read**

**Input:**
```json
{
  "filePath": "/Users/lyoko/Projects/flutter-projects/gapper/firebase.json"
}
```

**Output:**
```
<path>/Users/lyoko/Projects/flutter-projects/gapper/firebase.json</path>
<type>file</type>
<content>
1: {
2:   "flutter": {
3:     "platforms": {
4:       "android": {
5:         "default": {
6:           "projectId": "eepy-technologies",
7:           "appId": "1:334233025333:android:9cb413313a74f15f822a7c",
8:           "fileOutput": "android/app/google-services.json"
9:         }
10:       },
11:       "ios": {
12:         "default": {
13:           "projectId": "eepy-technologies",
14:           "appId": "1:334233025333:ios:ea1179606e3b61d4822a7c",
15:           "uploadDebugSymbols": false,
16:           "fileOutput": "ios/Runner/GoogleService-Info.plist"
17:         }
18:       },
19:       "dart": {
20:         "lib/firebase_options.dart": {
21:           "projectId": "eepy-technologies",
22:           "configurations": {
23:             "android": "1:334233025333:android:9cb413313a74f15f822a7c",
24:             "ios": "1:334233025333:ios:ea1179606e3b61d4822a7c"
25:           }
26:         }
27:       }
28:     }
29:   },
30:   "emulators": {
31:     "auth": {
32:       "port": 9099
33:     },
34:     "ui": {
35:       "enabled": true
36:     },
37:     "singleProjectMode": true
38:   },
39:   "firestore": {
40:     "database": "(default)",
41:     "location": "northamerica-northeast2",
42:     "rules": "firestore.rules",
43:     "indexes": "firestore.indexes.json"
44:   }
45: }

(End of file - total 45 lines)
</content>
```

---

## Assistant (Build · Big Pickle · 11.8s)

Here's the current state of Firestore in this project:

**Current setup (no changes made):**
- `firebase.json`, `firestore.rules`, `firestore.indexes.json` all exist — Firestore is configured server-side for the `eepy-technologies` project, but the rules are the insecure open-all default (expiring Oct 3, 2026).
- The app depends on `firebase_auth` and `firebase_core` but **not** `cloud_firestore`.

**Code state:**
- `lib/main.dart:27-35` initializes Firebase and the auth emulator (port 9099), but there's **no Firestore initialization or emulator** — the emulator config would need `firestore` added to `firebase.json`.
- `lib/noice/noice.dart` has a placeholder "NoIce" abstraction with `NoIceAuth`, and a comment "Firebase Features" — no Firestore layer yet.
- No Dart code imports or uses Firestore anywhere yet.

To actually use Firestore you'd need to add `cloud_firestore: ^5.x` to `pubspec.yaml`, initialize the Firestore emulator (`FirebaseFirestore.instance.useFirestoreEmulator("localhost", 8080)`) in debug, and start using `FirebaseFirestore.instance` — but that's future work I'm not doing per your request. Let me know if you'd like me to add a real Firestore example.

---

## User

how to store and load something in cloud firestore. make no changes

---

## Assistant (Build · Big Pickle · 8.2s)

Here's how to store and load data in Cloud Firestore from this Flutter project (no changes made):

**Prerequisite** — add `cloud_firestore` to `pubspec.yaml`, then initialize the emulator in `main.dart` (since this project uses `FIREBASE_ENABLED`):
```dart
await FirebaseFirestore.instance.useFirestoreEmulator("localhost", 8080); // debug only
```

**Store (write)**:
```dart
final db = FirebaseFirestore.instance;

// Add a new doc (auto-generated ID)
await db.collection('users').add({
  'name': 'Ada',
  'age': 36,
  'created': FieldValue.serverTimestamp(),
});

// Write to a specific doc id
await db.collection('users').doc('ada123').set({
  'name': 'Ada',
  'age': 36,
}, SetOptions(merge: true)); // merge: true to update without wiping fields
```

**Load (read)**:
```dart
// Get a single doc
final doc = await db.collection('users').doc('ada123').get();
if (doc.exists) {
  final data = doc.data();
  print(data?['name']);
}

// Query a collection (once)
final snap = await db.collection('users').where('age', isGreaterThan: 21).get();
for (final d in snap.docs) {
  print(d.data());
}

// Real-time stream
db.collection('users').snapshots().listen((snap) {
  for (final d in snap.docs) {
    print(d.data());
  }
});
```

**Notes specific to this project:**
- `lib/main.dart:27` guards Firebase init behind `FIREBASE_ENABLED` (currently `false` in `lib/features.dart:4`), so none of this runs until you flip that flag.
- `firestore.rules` currently allows all reads/writes (expires Oct 3, 2026) — so it'll work in dev now, but tighten rules for production.

Want me to actually wire these in?

---

## User

how to serialize a class into a dictionary/map recursivly in dart

---

## Assistant (Build · Big Pickle · 8.6s)

Here's how to recursively serialize a Dart object/class into a `Map`:

**Using a `toJson()` method** (manual, explicit):
```dart
class User {
  User(this.name, this.address);

  final String name;
  final Address address;

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address.toJson(), // call nested toJson
      };

  factory User.fromJson(Map<String, dynamic> json) =>
      User(json['name'] as String, Address.fromJson(json['address']));
}

class Address {
  Address(this.street, this.city);

  final String street;
  final String city;

  Map<String, dynamic> toJson() => {
        'street': street,
        'city': city,
      };

  factory Address.fromJson(Map<String, dynamic> json) =>
      Address(json['street'] as String, json['city'] as String);
}
```

This is the idiomatic Firestore-friendly approach, but it's manual — you must write `toJson`/`fromJson` for every class, and nested objects/collections need explicit handling.

**Using reflection (build_runner + json_serializable)** — automates it:
```dart
@JsonSerializable()
class User {
  User(this.name, this.address);
  final String name;
  final Address address;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
```
Generated code handles nested types recursively as long as each model has `fromJson`/`toJson`. Run `dart run build_runner build` to generate.

**If you want true automatic recursion** (no `toJson` on every class), use a reflection-based package like `reflectable` or `dart_mappable`, which can serialize any object graph by walking fields at runtime.

For your Firestore use case, `json_serializable` with `toJson`/`fromJson` is the standard pattern — register your model converter with `FirebaseFirestore.instance` or just call `user.toJson()` when writing and `User.fromJson(doc.data())` when reading.

---

## User

dart enum map value to int/string

---

## Assistant (Build · Big Pickle · 5.7s)

Here's how to map a Dart enum to an int or string:

```dart
enum Status { active, paused, deleted }

// Enum -> String (use .name)
final String s = Status.active.name;        // "active"

// String -> Enum (by name)
final Status e = Status.values.byName("active"); // Status.active

// Enum -> Int (use .index)
final int i = Status.active.index;          // 0 (position-based)

// Int -> Enum (by index)
final Status e2 = Status.values[0];         // Status.active
```

**Notes:**
- `.name` and `.byName` are built-in since Dart 2.15 — clean way to store in Firestore as strings.
- `.index` is positional, so it breaks if you reorder/insert enum values — safer to store the string name.
- For a custom stored value (an int you control, not positional), define a field:

```dart
enum Status {
  active(1), paused(2), deleted(3);

  const Status(this.value);
  final int value;

  static Status fromValue(int v) =>
      Status.values.firstWhere((e) => e.value == v);
}

final int i = Status.paused.value;   // 2
final Status e = Status.fromValue(2); // Status.paused
```

For Firestore, prefer storing the **string name** (`.name`) — it's readable, stable across reordering, and matches the JSON model pattern.

---

## User

how to initialize FirebaseFirestore 

---

## Assistant (Build · Big Pickle · 6.7s)

Here's how to initialize `FirebaseFirestore` in this Flutter project (no changes made):

**`FirebaseFirestore.instance` is auto-initialized** once `Firebase.initializeApp()` runs — there's no separate explicit init needed. In `lib/main.dart`, Firebase is already initialized at line 28, so you just grab the singleton:

```dart
import 'package:cloud_firestore/cloud_firestore.dart';

// Firestore is ready to use right after Firebase.initializeApp():
final db = FirebaseFirestore.instance;
```

**Emulator setup** (matches how this project sets up auth in `lib/main.dart:33`):
```dart
if (kDebugMode) {
  await FirebaseFirestore.instance.useFirestoreEmulator("localhost", 8080);
}
```

**Practical steps for this project:**
1. Add `cloud_firestore: ^5.x` to `pubspec.yaml`, run `flutter pub get`.
2. In `lib/main.dart`, inside the `if (FIREBASE_ENABLED)` block (after line 28), add the emulator call in debug mode — same pattern as `FirebaseAuth.instance.useAuthEmulator` on line 33.
3. Then `FirebaseFirestore.instance` works everywhere.

**Note:** `FirebaseFirestore.instance` won't function here until `FIREBASE_ENABLED` is `true` (currently `false` at `lib/features.dart:4`), since the whole Firebase block in `main.dart` is gated behind it.

---

