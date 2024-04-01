part of 'circular_switcher.dart';

class _CircularClipper extends CustomClipper<Path> {
  _CircularClipper({
    required this.padding,
    required this.relativeOffset,
    required this.radius,
  });

  final EdgeInsets padding;
  final Offset relativeOffset;
  final double radius;

  @override
  Path getClip(Size size) {
    final radiusRelative =
        radius * sqrt(pow(size.width, 2) + pow(size.height, 2));
    double x = size.width * relativeOffset.dx;
    double y = size.height * relativeOffset.dy;
    if (x < padding.left) x = padding.left;
    if (x > size.width - padding.right) x = size.width - padding.right;
    if (y < padding.top) y = padding.top;
    if (y > size.height - padding.bottom) y = size.height - padding.bottom;
    Path path = Path();
    if (radius < 1) {
      path.addOval(
        Rect.fromCircle(
          center: Offset(x, y),
          radius: radiusRelative,
        ),
      );
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
