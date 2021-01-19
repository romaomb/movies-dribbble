import 'package:bloc/bloc.dart';
import 'package:widgets_visibility_provider/widgets_visibility_provider.dart';

import '../model/movie_position.dart';
import '../model/offset_position.dart';

const _visibleRows = 3;
const _finalPosition = 100;
const _hideImageOffset = 150.0;

class OffsetPositionCubit extends Cubit<OffsetPosition> {
  OffsetPositionCubit() : super(OffsetPosition());

  void onScroll(
    PositionData? positionData,
    ImagePosition imagePosition,
    double imageHeight,
  ) {
    if (positionData != null) {
      double? left;
      double? top;
      double? right;
      double? bottom;

      final movieIndexPosition = positionData.data as int;
      final lateralOffset =
          _calculateLateralOffset(positionData, imagePosition, imageHeight);
      final verticalOffset =
          _calculateVerticalOffset(positionData, imagePosition, imageHeight);

      if (imagePosition.isLeft) {
        left = movieIndexPosition.isEven ? -lateralOffset : lateralOffset;
      } else {
        right = movieIndexPosition.isOdd ? -lateralOffset : lateralOffset;
      }

      if (imagePosition.isTop) {
        top = verticalOffset;
      } else {
        bottom = -verticalOffset;
      }

      emit(OffsetPosition(left: left, right: right, top: top, bottom: bottom));
    }
  }

  double _calculateLateralOffset(
    PositionData positionData,
    ImagePosition imagePosition,
    double imageHeight,
  ) {
    final start = positionData.startPosition;
    final end = positionData.endPosition;
    final eligibleStart = positionData.viewportSize / _visibleRows;
    final itemHeight = (end - start).abs();

    double lateralOffset = 0.0;
    if (end > 0 && start != 0 && start < eligibleStart) {
      lateralOffset = start < 0
          ? (1 - (end / itemHeight)) * _finalPosition
          : (1 - (end / positionData.viewportSize)) * (_finalPosition / 10);
    }
    return lateralOffset;
  }

  double _calculateVerticalOffset(
    PositionData positionData,
    ImagePosition imagePosition,
    double imageHeight,
  ) {
    final start = positionData.startPosition;
    final end = positionData.endPosition;
    final viewport = positionData.viewportSize;
    final itemHeight = (end - start).abs();

    double verticalOffset = 0.0;
    if (end > viewport) {
      final quarterItemHeight = itemHeight / 4;
      verticalOffset =
          (end > viewport + quarterItemHeight) ? _hideImageOffset : 0.0;
    }
    return verticalOffset;
  }
}
