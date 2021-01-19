class OffsetPosition {
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;

  OffsetPosition({
    this.left,
    this.top,
    this.right,
    this.bottom,
  });

  @override
  String toString() =>
      'left: $left | top: $top | right: $right | bottom: $bottom';
}
