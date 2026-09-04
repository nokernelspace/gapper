import 'package:flutter/material.dart';

class MoodSlider extends StatefulWidget {
  final double value;
  final Text? label;
  final ValueChanged<double>? onChanged;
  const MoodSlider(this.value, {this.label, this.onChanged, super.key});

  @override
  State<MoodSlider> createState() => _MoodSlider();
}

class _MoodSlider extends State<MoodSlider> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext ctx) {
    return Column(
      children: [
        widget.label ?? SizedBox.shrink(),
        Slider(
          value: _value,
          onChanged: (value) {
            setState(() {
              _value = value;
            });
            widget.onChanged?.call(value);
          },
        ),
      ],
    );
  }
}
