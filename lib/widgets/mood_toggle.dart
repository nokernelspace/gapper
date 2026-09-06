import 'package:flutter/material.dart';

class MoodToggle extends StatefulWidget {
  final bool firstValue;
  final Text? label;
  final ValueChanged<bool>? onChanged;
  const MoodToggle(this.firstValue, {this.label, this.onChanged, super.key});

  @override
  State<MoodToggle> createState() => _MoodToggle(this.onChanged);
}

class _MoodToggle extends State<MoodToggle> {
  final ValueChanged<bool>? onChanged;
  _MoodToggle(this.onChanged);

  // @override
  // void initState() {
  //   super.initState();
  //   _boolean = widget.boolean;
  // }

  @override
  Widget build(BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.label ?? SizedBox.shrink(),
        SizedBox(width: 42),
        Switch(
          value: widget.firstValue,
          onChanged: this.onChanged,
        ),
      ],
    );
  }
}
