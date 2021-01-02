import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_template/screens/home.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'providers/index.dart';

void main() async {
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providers = <SingleChildWidget>[
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => StateProvider()),
      ChangeNotifierProvider(create: (context) => DataProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ];

    return MultiProvider(
      providers: providers,
      builder: (context, _) =>
          Consumer4<AuthProvider, StateProvider, DataProvider, ThemeProvider>(
              builder: (BuildContext context,
                  AuthProvider auth,
                  StateProvider state,
                  DataProvider data,
                  ThemeProvider theme,
                  _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '@patkellydesigns',
          themeMode: theme.themeMode,
          darkTheme: theme.darkTheme,
          theme: theme.lightTheme,
          home: Home(),
        );
      }),
    );
  }
}
