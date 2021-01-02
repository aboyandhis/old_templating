import 'package:firebase_template/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class PAppBarAccountIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(FontAwesomeIcons.userAstronaut),
      onPressed: Provider.of<AuthProvider>(context).signInWithFaceBook,
    );
  }
}
