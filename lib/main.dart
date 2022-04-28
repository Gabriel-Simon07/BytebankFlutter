import 'package:flutter/material.dart';
import 'package:mobile/screens/contact_form.dart';
import 'package:mobile/screens/contacts_list.dart';
import 'package:mobile/screens/dashboard.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: ThemeData(
    primaryColor: Colors.green[900],
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
    buttonTheme: ButtonThemeData(
    buttonColor: Colors.blueAccent[700],
    textTheme: ButtonTextTheme.primary,
    )
    ),
      home: Dashboard(),
    );
  }
}


