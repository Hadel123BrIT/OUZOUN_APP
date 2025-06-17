import 'package:flutter/cupertino.dart';

class SlideAnimationWidget extends StatelessWidget {
  final Widget child;
  SlideAnimationWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero),
      duration: Duration(milliseconds: 800),
      curve: Curves.easeOutQuint,
      child: child,
      builder: (context, Offset value, child) {
        return Transform.translate(offset: value, child: child);
      },
    );
  }
}