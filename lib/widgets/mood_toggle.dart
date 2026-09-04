import 'package:flutter/material.dart';

class MoodToggle extends StatefulWidget {
  bool boolean;
  Text? label;
  MoodToggle(this.boolean, {this.label, super.key});

  @override
  State<MoodToggle> createState() => _MoodToggle();
}

class _MoodToggle extends State<MoodToggle> {
  @override
  Widget build(BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.label ?? SizedBox.shrink(),
        SizedBox(width: 42),
        Switch(
          value: widget.boolean,
          onChanged: (value) {
            setState(() {
              widget.boolean = !widget.boolean;
            });
          },
        ),
      ],
    );
  }
}
