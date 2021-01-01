import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template/screens/profile.dart';
import 'package:firebase_template/widgets/auth_button.dart';
import 'package:firebase_template/widgets/loading.dart';
import 'package:firebase_template/widgets/p_appbar.dart';
import 'package:firebase_template/widgets/p_floating_action_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream<User> userStream;
  User auth;

  @override
  void initState() {
    userStream = FirebaseAuth.instance?.authStateChanges();
    userStream?.listen((user) {
      if (user != null) {
        setState(() {
          auth = user;
        });
      }
    });
    super.initState();
  }

  Widget _buildBody() {
    var size = MediaQuery.of(context).size;
    switch (auth != null) {
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

  final appBar = PAppBar();
  @override
  Widget build(BuildContext context) {
    var _floatingActionButton = kIsWeb
        ? Container()
        : PFloatingActionButton(startChat: () {
            // Todo
          });

    return StreamBuilder<User>(
      stream: userStream,
      builder: (context, snapshot) => Scaffold(
        appBar: appBar,
        body: _buildBody(),
        floatingActionButton: _floatingActionButton,
      ),
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
