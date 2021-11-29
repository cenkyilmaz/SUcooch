import 'package:flutter_web/material.dart';
import 'package:fluttersignup/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  var title = "Coding Cafe";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "$title",
      debugShowCheckedModeBanner: false,
      home: Home(),

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

    );
  }
}