part of 'circular_switcher.dart';

class _CircularTransition extends AnimatedWidget {
  const _CircularTransition({
    this.child,
    required this.padding,
    required this.relativeOffset,
    required super.listenable,
  });

  final Offset relativeOffset;
  final EdgeInsets padding;

  Animation<double> get animation => listenable as Animation<double>;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (animation.value == 1) return child!;
    return ClipPath(
      clipper: _CircularClipper(
        padding: padding,
        radius: animation.value,
        relativeOffset: relativeOffset,
      ),
      child: child!,
    );
  }
}
