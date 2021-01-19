enum ImagePosition {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

extension ImagePositionRationale on ImagePosition {
  bool get isTop =>
      this == ImagePosition.topRight || this == ImagePosition.topLeft;

  bool get isBottom =>
      this == ImagePosition.bottomRight || this == ImagePosition.bottomLeft;

  bool get isLeft =>
      this == ImagePosition.topLeft || this == ImagePosition.bottomLeft;

  bool get isRight =>
      this == ImagePosition.topRight || this == ImagePosition.bottomRight;

  double get xAlignment => this.isLeft ? -1.0 : 1.0;

  double get yAlignment => this.isTop ? -1.0 : 1.0;
}
