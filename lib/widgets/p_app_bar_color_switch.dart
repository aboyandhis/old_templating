import 'package:firebase_template/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PAppBarColorSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var onChanged = Provider.of<ThemeProvider>(context);
    return Switch(
      onChanged: (val) => onChanged.toggleDark(),
      value: onChanged.themeDark,
    );
  }
}
