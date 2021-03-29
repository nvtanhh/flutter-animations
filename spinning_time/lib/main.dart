import 'package:flutter/material.dart';
import 'package:spinning_time/ufo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        body: Container(
          color: Colors.black,
          child: Center(
            child: UFOScreen(),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
