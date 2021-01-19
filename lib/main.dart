import 'package:flutter/material.dart';
import 'package:mar/mario_animation_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'simp mario',
      home: MarioAnimationDemo(),
    );
  }
}
