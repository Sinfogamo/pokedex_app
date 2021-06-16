import 'package:flutter/material.dart';

class ThemeLight {
  final Color primary = Colors.redAccent;
  final Color secondary = Colors.blue;
  final Color blackForm = Color(0xFF4D4D4D);
  final Color subtitleGrey = Color(0xFF606060);

  // ignore: non_constant_identifier_names
  ThemeData get Theme => ThemeData(
        primaryColor: primary,
        focusColor: primary,
        accentColor: primary,
        hintColor: blackForm,
        buttonTheme: ButtonThemeData(
          buttonColor: primary,
          padding: EdgeInsets.symmetric(vertical: 12.0),
        ),
        iconTheme: IconThemeData(color: primary),
      );
}

final ButtonStyle raisedButton = ElevatedButton.styleFrom(
  primary: Colors.redAccent,
  elevation: 5,
  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
);

final ButtonStyle raisedButtonOrange = ElevatedButton.styleFrom(
  primary: Colors.orange,
  elevation: 5,
  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
);
