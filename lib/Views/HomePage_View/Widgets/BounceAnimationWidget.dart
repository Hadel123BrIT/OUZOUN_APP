import 'package:flutter/cupertino.dart';

class BounceAnimationWidget extends StatelessWidget {
  final Widget child;
  BounceAnimationWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 1000),
      curve: Curves.elasticOut,
      child: child,
      builder: (context, double value, child) {
        return Transform.scale(scale: value, child: child);
      },
    );
  }
}