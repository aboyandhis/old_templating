import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PFloatingActionButton extends StatelessWidget {
  final VoidCallback startChat;

  const PFloatingActionButton({Key key, this.startChat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: startChat,
      tooltip: 'Message',
      child: Icon(FontAwesomeIcons.facebookMessenger),
    );
  }
}
