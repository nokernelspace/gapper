# Source Tree
```
lib/
├── data/                   another attempt to a serializable/deserializable data model
│   └── mood.dart         
├── noice/                  ambitious Firebase shim for cross-platform localstore with cloudstore
│  └──                      files here should be used only as play-testing reference when working on the Noicec package
├── widgets/                general purpose widgets. should be copy and pastable. could be packages
│   ├── dialogs.dart        throwbadck to win32 dialog boxes
│   ├── mood_log.dart
│   ├── mood_slider.dart    Column([Text(), Slider()])
│   └── mood_toggle.dart    Row([Text(), Switch()])
│
└── wrappers/          Wrappers for 3rd-Party Platforms
 └── gemini.dart         
```

# gapper

Gemini API Wrapper

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Features
[ ] Log View
[ ] Mood tracking View
[ ] Allow user to chose main Note
[ ] Make sheet disapepar on selected `ListTile`
[ ] Allows slide to delete `Mood` from `MoodLog`
[ ] Firebase
    [ ] Auth
    [ ] Cloud Backup
    [ ] Work on `Noice` a lil if you get here

## Bugs
[ ] Fix UI breaking on `reduplicate`
[ ] Fix UI breaking on `new`
[ ] Fix UI breaking on loading mood from sheet

## Configuring
`git clone https://github.com/nokernelspace/gapper`


## Extras
[ ] Add neat animations
    [ ] Snackbar
[ ] `Noice` package
[ ] Import data from various LLM sources