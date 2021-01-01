import 'package:firebase_template/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PAppBarCircleAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    return CircleAvatar(
      backgroundImage: NetworkImage(authProvider.currentUser.photoURL),
    );
  }
}
