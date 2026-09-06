import 'package:flutter/material.dart';

class MoodSlider extends StatefulWidget {
  final double value;
  final Text? label;
  final ValueChanged<double>? onChanged;
  const MoodSlider(this.value, {this.label, this.onChanged, super.key});

  @override
  State<MoodSlider> createState() => _MoodSlider(this.value, this.onChanged);
}

class _MoodSlider extends State<MoodSlider> {
  final double value;
  final ValueChanged<double>? onChanged;
  _MoodSlider(this.value, this.onChanged);
  // late double _value;

  // @override
  // void initState() {
  //   super.initState();
  //   // _value = widget.value;
  // }

  @override
  Widget build(BuildContext ctx) {
    return Column(
      children: [
        widget.label ?? SizedBox.shrink(),
        Slider(
          value: this.value,
          onChanged: this.onChanged,
        ),
      ],
    );
  }
}
