import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template/providers/auth.dart';
import 'package:firebase_template/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _authProvider = Provider.of<AuthProvider>(context);

    return StreamBuilder<User>(
        stream: _authProvider.userStream,
        builder: (context, snapshot) {
          return _authProvider.currentUser != null
              ? Center(
                  child: Card(
                    child: Column(children: [
                      Image.network(_authProvider.currentUser.photoURL),
                      Text(_authProvider.currentUser.displayName),
                    ]),
                  ),
                )
              : Loading();
        });
  }
}
