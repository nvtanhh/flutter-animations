import 'package:animations/constant/colors.dart';
import 'package:animations/ui/ball_loading_button.dart';
import 'package:animations/ui/circle_spin_loading.dart';
import 'package:animations/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animations',
      theme: ThemeData(
        scaffoldBackgroundColor: GREY_DARK,
        textTheme: GoogleFonts.montserratTextTheme().apply(
          bodyColor: WHITE,
        ),
        appBarTheme: AppBarTheme(
          color: GREY_DARK,
          elevation: 0.0,
        ),
      ),
      routes: {
        '/': (context) => MyHomePage(),
        'ball_loading_btn': (context) => BallLoading(),
        'circle_spin_loading': (context) => CircleSpinLoading()
      },
    );
  }
}
