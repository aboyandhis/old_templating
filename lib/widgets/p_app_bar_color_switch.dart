import 'package:firebase_template/providers/state.dart';
import 'package:flutter/material.dart';

class PAppBarColorSwitch extends StatelessWidget {
  const PAppBarColorSwitch({
    Key key,
    @required this.onChanged,
  }) : super(key: key);

  final StateProvider onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
      onChanged: (val) => onChanged.toggleDark,
      value: onChanged.darkMode,
    );
  }
}
