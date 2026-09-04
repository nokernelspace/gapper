import 'package:flutter/material.dart';

class MoodSlider extends StatefulWidget {
  double value;
  Text? label;
  MoodSlider(this.value, {this.label, super.key});

  @override
  State<MoodSlider> createState() => _MoodSlider();
}

class _MoodSlider extends State<MoodSlider> {
  @override
  Widget build(BuildContext ctx) {
    return Column(
      children: [
        widget.label ?? SizedBox.shrink(),
        Slider(
          value: widget.value,
          onChanged: (value) {
            setState(() {
              widget.value = value;
            });
          },
        ),
      ],
    );
  }
}
