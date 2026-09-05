import 'dart:convert';

import 'package:flutter/material.dart';

import 'dart:developer' as developer;

typedef Bullet = String;

class Mood {
  DateTime time = DateTime.now();
  List<Bullet> notes = List.from([]);

  /// Equivalent to List.empty(growable: true)

  Modes modes = Modes();
  Happy happy = Happy();
  Sad sad = Sad();
  People people = People.I;

  Mood();
  Mood.from(this.modes, this.happy, this.sad, this.people, this.notes);

  dynamic toJson() => {
    'modes': modes.toJson(),
    'happy': happy.toJson(),
    'sad': sad.toJson(),
    'people': people.toJson(),
    'notes': notes.map((x) => x).toList(),
  };

  static Mood fromJson(Map<String, dynamic> json) {
    return Mood.from(
      Modes.fromJson(json["modes"]),
      Happy.fromJson(json["happy"]),
      Sad.fromJson(json["sad"]),
      People.fromJson(json["people"]),
      List<Bullet>.from(json["notes"].map((x) {return x as Bullet;})),
    );
  }
}

enum People {
  FRIENDS,
  FAMILY,
  I;

  /// NOTE: the list
  dynamic toJson() => this.name;
  static People fromJson(String people) {
    return People.values.byName(people);
  }
  static List<DropdownMenuEntry<People>> entries = () {
    List<DropdownMenuEntry<People>> out = List.empty(growable: true);
    for (var v in People.values) {
      out.add(DropdownMenuEntry(value: v, label: v.name));
    }
    return out;
  }();
}

class Modes {
  bool relax = false;
  bool physical = false;
  bool working = false;
  bool learning = false;

  Modes();
  Modes.from(this.relax, this.physical, this.working, this.learning);

  dynamic toJson() => {
    "relax": relax,
    "physical": physical,
    "working": working,
    "learning": learning,
  };

  static Modes fromJson(Map<String, dynamic> modes) {
    return Modes.from(
      modes["relax"] as bool,
      modes["physical"] as bool,
      modes["working"] as bool,
      modes["learning"] as bool,
    );
  }
}

class Happy {
  double joy = 0.0;
  double fufillment = 0.0;
  double confidence = 0.0;
  double determination = 0.0;

  Happy();
  Happy.from(this.joy, this.fufillment, this.confidence, this.determination);

  dynamic toJson() => {
    "joy": joy,
    "fufillment": fufillment,
    "confidence": confidence,
    "determination": determination,
  };

  static Happy fromJson(Map<String, dynamic> json) {
    return Happy.from(
      json["joy"] as double,
      json["fufillment"] as double,
      json["confidence"] as double,
      json["determination"] as double,
    );
  }
}

class Sad {
  double stress = 0.0;
  double dissapointment = 0.0;
  double worry = 0.0;
  double disgust = 0.0;

  Sad();
  Sad.from(this.stress, this.dissapointment, this.worry, this.disgust);

  dynamic toJson() => {
    "stress": stress,
    "dissapointment": dissapointment,
    "worry": worry,
    "disgust": disgust,
  };

  static Sad fromJson(Map<String, dynamic> json) {
    return Sad.from(
      json["stress"] as double,
      json["dissapointment"] as double,
      json["worry"] as double,
      json["disgust"] as double,
    );
  }
}
