import 'package:flutter/material.dart';

class MarioAnimationDemo extends StatefulWidget {
  @override
  _MarioAnimationDemoState createState() => _MarioAnimationDemoState();
}

class _MarioAnimationDemoState extends State<MarioAnimationDemo>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  Animation<double> marioX;
  Animation<double> marioY;
  Animation<int> marioFrame;

  Animation<double> blockY;
  Animation<int> blockFrame;

  Animation<double> coinY;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 8));

    List<double> weights = [1.0, 1.0, .3, .4, 1.0];

    marioX = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.5), weight: weights[0]),
      TweenSequenceItem(tween: Tween(begin: 0.5, end: 0.5), weight: weights[1]),
      TweenSequenceItem(tween: Tween(begin: 0.5, end: 0.5), weight: weights[2]),
      TweenSequenceItem(tween: Tween(begin: 0.5, end: 0.5), weight: weights[3]),
      TweenSequenceItem(tween: Tween(begin: 0.5, end: 1), weight: weights[4]),
    ]).animate(animationController);

    marioY = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: weights[1]),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: weights[2]),
      TweenSequenceItem(
          tween: Tween(begin: 0.0, end: 1.0)
              .chain(CurveTween(curve: Curves.easeOutQuad)),
          weight: weights[3]),
      TweenSequenceItem(
          tween: Tween(begin: 1.0, end: 0.0)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: weights[4]),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: weights[0]),
    ]).animate(animationController);

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Stack(
        children: [
          AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return Positioned(
                  left: marioX.value * size.width - 16,
                  top: size.height / 2 - 80 * marioY.value,
                  child: Image(image: AssetImage('assets/mario_1.png')),
                );
              })
        ],
      ),
    );
  }
}
