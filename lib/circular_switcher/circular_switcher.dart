import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:math';

part 'animated_swithcer.dart';
part 'circular_clipper.dart';
part 'circular_reverse_curve.dart';
part 'circular_transition.dart';

class CircularSwitcher extends StatelessWidget {
  const CircularSwitcher({
    super.key,
    this.padding = const EdgeInsets.all(16.0),
    this.relativeOffset = const Offset(0, 0),
    required this.duration,
    required this.child,
  });

  final EdgeInsets padding;
  final Offset relativeOffset;
  final Duration duration;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _AnimatedSwitcher(
      duration: duration,
      switchOutCurve: const _CircularReverseCurve(),
      switchInCurve: Curves.linear,
      transitionBuilder: (child, animation) {
        if (animation.status == AnimationStatus.forward ||
            animation.status == AnimationStatus.reverse) return child;
        return _CircularTransition(
          padding: padding,
          relativeOffset: relativeOffset,
          listenable: animation,
          child: child,
        );
      },
      child: child,
    );
  }
}
