import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeProvider extends ChangeNotifier {
  static final primaryColor = Colors.purple;
  static final accentColor = Colors.yellow[200];
  static final lightTextColor = Colors.grey[100];
  static final primary = Colors.purple;
  static final darkSurfaceColor = Colors.black87;
  static final lightSurfaceColor = lightTextColor;
  static final darkTextColor = Colors.black87;

  static final lightTextTheme = TextTheme(
    bodyText1: darkTextStyle,
    headline1: darkTextStyle,
    headline2: darkTextStyle,
    headline3: darkTextStyle,
    headline4: darkTextStyle,
    headline5: darkTextStyle,
    headline6: darkTextStyle,
    button: darkTextStyle,
  );
  static final darkTextTheme = TextTheme(
    bodyText1: lightTextStyle,
    headline1: lightTextStyle,
    headline2: lightTextStyle,
    headline3: lightTextStyle,
    headline4: lightTextStyle,
    headline5: lightTextStyle,
    headline6: lightTextStyle,
    button: lightTextStyle,
  );

  static final lightTextStyle = TextStyle(color: lightTextColor);
  static final darkTextStyle = TextStyle(color: darkTextColor);
  static final appBarThemeDark =
      AppBarTheme(textTheme: darkTextTheme, backgroundColor: darkSurfaceColor);
  static final appBarThemeLight = AppBarTheme(
      textTheme: lightTextTheme, backgroundColor: lightSurfaceColor);

  final darkTheme = ThemeData(
      scaffoldBackgroundColor: darkSurfaceColor,
      backgroundColor: darkSurfaceColor,
      appBarTheme: appBarThemeDark,
      textTheme: darkTextTheme,
      primaryColor: primary,
      accentColor: accentColor,
      primarySwatch: primaryColor);

  final lightTheme = ThemeData(
    scaffoldBackgroundColor: lightSurfaceColor,
    backgroundColor: lightSurfaceColor,
    primarySwatch: primaryColor,
    primaryColor: primary,
    accentColor: accentColor,
    textTheme: lightTextTheme,
    appBarTheme: appBarThemeLight,
  );
  get themeMode => null;

  ThemeMode getInitialThemeMode(BuildContext context) {
    Brightness brightness = MediaQuery.platformBrightnessOf(context);
    if (brightness == Brightness.light) {
      themeDark = false;
      notifyListeners();
      return ThemeMode.light;
    } else {
      themeDark = true;
      notifyListeners();
      return ThemeMode.dark;
    }
  }

  bool themeDark = false;
  toggleDark() {
    // Flip the bool
    themeDark = !themeDark;

    notifyListeners();
  }
}
