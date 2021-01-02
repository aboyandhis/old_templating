import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template/providers/auth.dart';
import 'package:firebase_template/screens/profile.dart';
import 'package:firebase_template/widgets/p_appbar.dart';
import 'package:firebase_template/widgets/p_login_button.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthProvider auth = AuthProvider();
  Stream<User> userStream;
  bool user = false;

  @override
  void initState() {
    if (auth.currentUser != null) {
      setState(() {
        user = true;
      });

      super.initState();
    }
  }

  Widget homePage(context, AsyncSnapshot<User> snapshot) {
    var size = MediaQuery.of(context).size;
    var user = snapshot.data;

    if (user != null)
      return Center(
          child: SizedBox(
              height: size.height, width: size.width, child: Profile()));
    else
      return Login();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot<User> snapshot) => Scaffold(
        appBar: PAppBar(),
        body: homePage(context, snapshot),
      ),
    );
  }
}
