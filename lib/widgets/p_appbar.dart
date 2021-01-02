import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template/providers/auth.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'index.dart';

class PAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          User user = snapshot.data;
          print(user);
          return AppBar(
            automaticallyImplyLeading: true,
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('512.png'),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(width: 16),
                Text("@patkellydesigns"),
              ],
            ),
            actions: [
              PAppBarColorSwitch(),
              AppBarAccountIcon(),
              IconButton(
                icon: Icon(FontAwesomeIcons.github),
                onPressed: () {
                  print('');
                },
              )
            ],
          );
        });
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class AppBarAccountIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthProvider>(context);
    return auth.currentUser != null
        ? PAppBarCircleAvatar()
        : PAppBarAccountIconButton();
  }
}
