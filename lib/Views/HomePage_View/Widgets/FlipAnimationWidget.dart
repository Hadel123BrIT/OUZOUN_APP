import 'package:flutter/cupertino.dart';

class FlipAnimationWidget extends StatelessWidget {
  final Widget child;
  FlipAnimationWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 600),
      curve: Curves.fastOutSlowIn,
      builder: (context, double value, child) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(value * 2 * 3.141),
          alignment: Alignment.center,
          child: child,
        );
      },
      child: child,
    );
  }
}