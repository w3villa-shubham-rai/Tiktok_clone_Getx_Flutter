import 'package:flutter/material.dart';
class CircleAnimation extends StatefulWidget {
  final Widget child;
  const CircleAnimation({super.key,required this.child});

  @override
  State<CircleAnimation> createState() => _CircleAnimationState();
}

class _CircleAnimationState extends State<CircleAnimation> with SingleTickerProviderStateMixin {
  
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
         controller=AnimationController(vsync: this,duration: const Duration(milliseconds: 6000));
         controller.forward();
         controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return RotationTransition(turns: Tween(begin: 0.0,end: 1.0).animate(controller),
    child: widget.child,);
    
  }
}