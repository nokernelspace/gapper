import 'package:flutter/material.dart';

class MoodToggle extends StatefulWidget {
  final bool boolean;
  final Text? label;
  final ValueChanged<bool>? onChanged;
  const MoodToggle(this.boolean, {this.label, this.onChanged, super.key});

  @override
  State<MoodToggle> createState() => _MoodToggle(this.boolean, this.onChanged);
}

class _MoodToggle extends State<MoodToggle> {
  final bool boolean;
  final ValueChanged<bool>? onChanged;
  _MoodToggle(this.boolean, this.onChanged);

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
          value: this.boolean,
          onChanged: this.onChanged,
        ),
      ],
    );
  }
}
