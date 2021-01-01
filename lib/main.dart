import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_template/providers/auth.dart';
import 'package:firebase_template/providers/data.dart';
import 'package:firebase_template/providers/state.dart';
import 'package:firebase_template/screens/home.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() async {
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var primary = Colors.purple;
    var primaryColor = Colors.purple[200];
    var accentColor = Colors.purple[200];
    var darkSurfaceColor = Colors.black87;
    var lightSurfaceColor = Colors.grey[100];
    var darkSTextColor = Colors.black87;
    var lightTextColor = Colors.grey[100];

    final providers = <SingleChildWidget>[
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => StateProvider()),
      ChangeNotifierProvider(create: (context) => DataProvider()),
    ];

    final appBarTheme = AppBarTheme(
        iconTheme: IconThemeData(color: accentColor),
        color: darkSurfaceColor,
        textTheme: TextTheme(
            headline6: TextStyle(
          color: lightTextColor,
        )));
    final darkTheme = ThemeData(
      primarySwatch: primary,
      primaryColor: primaryColor,
      accentColor: accentColor,
      appBarTheme: appBarTheme,
      iconTheme: IconThemeData(
        color: Colors.purple,
      ),
      backgroundColor: darkSurfaceColor,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: lightTextColor),
      ),
    );

    return MultiProvider(
      providers: providers,
      builder: (context, _) =>
          Consumer3<AuthProvider, StateProvider, DataProvider>(builder:
              (BuildContext context, AuthProvider auth, StateProvider state,
                  DataProvider data, _) {
        ThemeMode _themeMode =
            state.darkMode ? ThemeMode.dark : ThemeMode.light;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '@patkellydesigns',
          themeMode: _themeMode,
          darkTheme: darkTheme,
          theme: ThemeData(
              accentColor: accentColor,
              primaryColor: primary,
              textTheme:
                  TextTheme(bodyText1: TextStyle(color: lightTextColor))),
          home: Home(),
        );
      }),
    );
  }
}
