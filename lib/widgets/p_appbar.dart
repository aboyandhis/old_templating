import 'package:firebase_template/providers/auth.dart';
import 'package:firebase_template/providers/state.dart';
import 'package:firebase_template/widgets/p_app_bar_account_icon_button.dart';
import 'package:firebase_template/widgets/p_app_bar_circle_avatar.dart';
import 'package:firebase_template/widgets/p_app_bar_color_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    var onChanged = Provider.of<StateProvider>(context);
    var auth = Provider.of<AuthProvider>(context);

    return AppBar(
      title: Text("@patkellydesigns"),
      actions: [
        PAppBarColorSwitch(onChanged: onChanged),
        auth.currentUser != null
            ? PAppBarCircleAvatar()
            : PAppBarAccountIconButton(auth: auth)
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
