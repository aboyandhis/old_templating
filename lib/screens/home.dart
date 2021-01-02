import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template/providers/auth.dart';
import 'package:firebase_template/screens/profile.dart';
import 'package:firebase_template/widgets/auth_button.dart';
import 'package:firebase_template/widgets/p_appbar.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream<User> userStream;

  @override
  void initState() {
    userStream = AuthProvider().userStream;
    userStream.listen((event) {
      setState(() {});
    });

    super.initState();
  }

  Widget _buildBody(context) {
    var size = MediaQuery.of(context).size;
    var auth = Provider.of<AuthProvider>(context);
    switch (auth.currentUser != null) {
      case (true):
        return Center(
            child: SizedBox(
          height: size.height,
          width: size.width,
          child: Profile(),
        ));
        break;
      case (false):
        return Login();
        break;
      default:
        return Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: userStream,
      builder: (context, snapshot) =>
          Scaffold(appBar: PAppBar(), body: _buildBody(context)),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _texTheme = Theme.of(context).textTheme;
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
      Text('Sign in with your favorite provider', style: _texTheme.headline6),
      SizedBox(height: 36),
      AuthButton(title: 'Facebook', fontAwesomeIcon: FontAwesomeIcons.facebookF)
    ]));
  }
}
