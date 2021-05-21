import 'package:books_app/screens/login/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BooksApp',
        theme: ThemeData(
          primaryColor: Colors.teal.shade700,
        ),
        home: LoginPage());
  }
}
