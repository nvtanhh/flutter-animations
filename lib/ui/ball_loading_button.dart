import 'dart:async';
import 'package:animations/constant/colors.dart';
import 'package:animations/ui/rounded_loading_button.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class BallLoading extends StatefulWidget {
  @override
  _BallLoadingState createState() => _BallLoadingState();
}

class _BallLoadingState extends State<BallLoading> {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  @override
  void initState() {
    super.initState();
  }

  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      _btnController.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rounded Loading Button'),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: RoundedLoadingButton(
          child: Text('Tap me!', style: TextStyle(color: Colors.white)),
          controller: _btnController,
          onPressed: _doSomething,
          // duration: Duration(seconds: 10),
        ),
      ),
    );
  }
}
