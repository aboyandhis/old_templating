import 'package:firebase_template/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthButton extends StatelessWidget {
  final IconData fontAwesomeIcon;

  final String title;

  const AuthButton({Key key, this.fontAwesomeIcon, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var onPressed = Provider.of<AuthProvider>(context);
    return FlatButton.icon(
      padding: EdgeInsets.symmetric(horizontal: 64, vertical: 32),
      color: Theme.of(context).accentColor,
      icon: Icon(fontAwesomeIcon),
      label: Text(title),
      onPressed: onPressed.signInWithFaceBook,
    );
  }
}
