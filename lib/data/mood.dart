import 'package:flutter/material.dart';

class Mood {
  DateTime time = DateTime.now();
  List<String> notes = List.from([]);   // Equivalent to List.empty(growable: true)

  Modes modes = Modes();
  Happy happy = Happy();
  Sad sad = Sad();
  People people = People.I;

  Mood();
  Mood.from(this.modes, this.happy, this.sad, this.people);

  dynamic toJson() => {
    'modes': modes.toJson(),
    'happy': happy.toJson(),
    'sad': sad.toJson(),
    'people': people.toJson(),
  };

  static Mood fromJson(Map<String, dynamic> json) => Mood.from(
    Modes.fromJson(json["modes"]),
    Happy.fromJson(json["happy"]),
    Sad.fromJson(json["sad"]),
    People.fromJson(json["people"]),
  );
}

enum People {
  FRIENDS, FAMILY, I;

  /// NOTE: the list
  dynamic toJson() => [this.name];
  static People fromJson(List<String> people) => People.values.byName(people.first);

  static List<DropdownMenuEntry<People>> entries = (){
    List<DropdownMenuEntry<People>> out  =  List.empty(growable: true);
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

  static Modes fromJson(Map<String, bool> modes) {
    return Modes.from(
      modes["relax"]!,
      modes["physical"]!,
      modes["working"]!,
      modes["learning"]!,
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

  static Happy fromJson(Map<String, double> json) {
    return Happy.from(
      json["joy"]!,
      json["fufillment"]!,
      json["confidence"]!,
      json["determination"]!,
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

  static Sad fromJson(Map<String, double> json) {
    return Sad.from(
      json["joy"]!,
      json["fufillment"]!,
      json["confidence"]!,
      json["determination"]!,
    );
  }
}
