import 'package:books_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.teal.shade700,
        ),
        home: LoginPage());
  }
}
