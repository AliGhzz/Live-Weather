import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatelessWidget {
  String name;
  Loading({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    if (name == "halfTriangleDot") {
      return LoadingAnimationWidget.halfTriangleDot(
          color: Colors.white, size: 50);
    } else if (name == "bouncingBall") {
      return LoadingAnimationWidget.bouncingBall(color: Colors.white, size: 50);
    } else if (name == "fallingDot") {
      return LoadingAnimationWidget.fallingDot(color: Colors.white, size: 50);
    } else if (name == "hexagonDots") {
      return LoadingAnimationWidget.hexagonDots(color: Colors.white, size: 50);
    } else {
      return LoadingAnimationWidget.discreteCircle(
          color: Colors.white, size: 50);
    }
  }
}
