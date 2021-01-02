import 'package:firebase_template/providers/auth.dart';

import 'package:firebase_template/widgets/p_app_bar_account_icon_button.dart';
import 'package:firebase_template/widgets/p_app_bar_circle_avatar.dart';
import 'package:firebase_template/widgets/p_app_bar_color_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class PAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthProvider>(context);

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
        auth.currentUser != null
            ? PAppBarCircleAvatar()
            : PAppBarAccountIconButton(auth: auth),
        IconButton(
          icon: Icon(FontAwesomeIcons.github),
          onPressed: () {
            //TODO implement URL launcher for https://github.com/patkellydesigns/patkellydesigns
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
