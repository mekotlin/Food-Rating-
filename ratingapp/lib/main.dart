import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ratingapp/home_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
        backgroundColor: Color(0xFFFFCC06),
        body: HomePage(),
      ),
    );
  }
}
