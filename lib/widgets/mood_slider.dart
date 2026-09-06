import 'package:flutter/material.dart';

class MoodSlider extends StatefulWidget {
  final double firstValue;
  final Text? label;
  final ValueChanged<double>? onChanged;
  const MoodSlider(this.firstValue, {this.label, this.onChanged, super.key});

  @override
  State<MoodSlider> createState() => _MoodSlider(this.onChanged);
}

class _MoodSlider extends State<MoodSlider> {
  final ValueChanged<double>? onChanged;
  _MoodSlider(this.onChanged);
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
          value: widget.firstValue,
          onChanged: this.onChanged,
        ),
      ],
    );
  }
}
