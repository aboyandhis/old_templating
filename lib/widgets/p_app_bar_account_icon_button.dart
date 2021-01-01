import 'package:firebase_template/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PAppBarAccountIconButton extends StatelessWidget {
  const PAppBarAccountIconButton({
    Key key,
    @required this.auth,
  }) : super(key: key);

  final AuthProvider auth;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(FontAwesomeIcons.userAstronaut),
      onPressed: auth.signInWithFaceBook,
    );
  }
}
