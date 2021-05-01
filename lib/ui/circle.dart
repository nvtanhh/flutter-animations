import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final double radius;
  final Color color;
  const Circle({Key key, this.radius, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius * 2,
      width: radius * 2,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
