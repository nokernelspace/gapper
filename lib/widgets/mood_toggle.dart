import 'package:flutter/material.dart';

class MoodToggle extends StatefulWidget {
  final bool boolean;
  final Text? label;
  final ValueChanged<bool>? onChanged;
  const MoodToggle(this.boolean, {this.label, this.onChanged, super.key});

  @override
  State<MoodToggle> createState() => _MoodToggle();
}

class _MoodToggle extends State<MoodToggle> {
  late bool _boolean;

  @override
  void initState() {
    super.initState();
    _boolean = widget.boolean;
  }

  @override
  Widget build(BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.label ?? SizedBox.shrink(),
        SizedBox(width: 42),
        Switch(
          value: _boolean,
          onChanged: (value) {
            setState(() {
              _boolean = !_boolean;
            });
            widget.onChanged?.call(!_boolean);
          },
        ),
      ],
    );
  }
}
