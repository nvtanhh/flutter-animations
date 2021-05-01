import 'package:animations/constant/colors.dart';
import 'package:animations/ui/circle.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircleSpinLoading extends StatefulWidget {
  @override
  _CircleSpinLoadingState createState() => _CircleSpinLoadingState();
}

class _CircleSpinLoadingState extends State<CircleSpinLoading>
    with TickerProviderStateMixin {
  AnimationController _deteachAnimationController;
  AnimationController _rotateAnimationController;
  AnimationController _scaleAnimationController;
  Animatable<Offset> _slideCurve;
  Animation _scaleAnimation;
  Color _circleColor = WHITE;
  Color _bgColor = GREY_DARK;
  Color _nextColor = WHITE;
  double _bgOpacity = 0;

  @override
  void initState() {
    super.initState();
    _deteachAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _rotateAnimationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _scaleAnimationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _slideCurve = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, -2.5));

    _scaleAnimation =
        Tween<double>(begin: 0, end: 20).animate(_scaleAnimationController);

    _deteachAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(
          Duration(milliseconds: 50),
          () => _rotateAnimationController.forward(),
        );
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          _bgOpacity = 1;
          _circleColor = _bgColor;
        });
        _scaleAnimationController.forward();
      }
    });

    _rotateAnimationController.addListener(() {
      if (_rotateAnimationController.isCompleted) {
        _deteachAnimationController.reverse();
        _rotateAnimationController.reset();
      }
    });

    _scaleAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _bgColor = _nextColor;
          _bgOpacity = _bgOpacity == 0 ? 1 : 0;
          _nextColor = _circleColor;
        });
        _scaleAnimationController.reset();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _deteachAnimationController.dispose();
    _rotateAnimationController.dispose();
    _scaleAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startAnimate,
      child: Container(
        color: _bgColor,
        child: Stack(
          children: [
            Center(
              child: Stack(
                children: [
                  Opacity(
                    opacity: _bgOpacity,
                    child: AnimatedBuilder(
                      animation: _scaleAnimation,
                      builder: (c, child) => Transform.scale(
                        scale: _scaleAnimation.value,
                        child: _circle(color: _nextColor),
                      ),
                    ),
                  ),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationX(math.pi),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: _circle(color: _circleColor),
                    ),
                  ),
                  _circle(color: _circleColor),
                ],
              ),
            ),
            SafeArea(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: _nextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startAnimate() {
    _deteachAnimationController.forward();
  }

  Widget _circle({Color color}) {
    return RotationTransition(
      turns: _rotateAnimationController,
      child: SlideTransition(
        position: _deteachAnimationController.drive(_slideCurve),
        child: Circle(
          radius: 20,
          color: color,
        ),
      ),
    );
  }
}
