import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template/providers/index.dart';
import 'package:firebase_template/widgets/loading.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  Stream<User> auth(context) => Provider.of<AuthProvider>(context).userStream;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: auth(context),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          if (snapshot.data == null)
            return Loading();
          else {
            var data = snapshot.data;

            return Center(
              child: Card(
                elevation: 3,
                child: Column(children: [
                  Image.network(
                    data.photoURL,
                    fit: BoxFit.fill,
                  ),
                  Text(data.displayName),
                ]),
              ),
            );
          }
        });
  }
}
