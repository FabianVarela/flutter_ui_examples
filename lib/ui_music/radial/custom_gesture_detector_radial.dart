import 'dart:math';

import 'package:flutter/material.dart';

typedef RadialDragStart = void Function(Coordinates startCoords);
typedef RadialDragUpdate = void Function(Coordinates updateCoords);
typedef RadialDragEnd = void Function();

class CustomGestureDetectorRadial extends StatefulWidget {
  const CustomGestureDetectorRadial({
    required this.child,
    this.onRadialDragStart,
    this.onRadialDragUpdate,
    this.onRadialDragEnd,
    super.key,
  });

  final Widget child;
  final RadialDragStart? onRadialDragStart;
  final RadialDragUpdate? onRadialDragUpdate;
  final RadialDragEnd? onRadialDragEnd;

  @override
  _CustomGestureDetectorRadialState createState() =>
      _CustomGestureDetectorRadialState();
}

class _CustomGestureDetectorRadialState
    extends State<CustomGestureDetectorRadial> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.child,
      onPanStart: (DragStartDetails details) {
        if (widget.onRadialDragStart != null) {
          widget.onRadialDragStart?.call(
            _getCoordinatesFromOffset(details.globalPosition),
          );
        }
      },
      onPanUpdate: (DragUpdateDetails details) {
        if (widget.onRadialDragUpdate != null) {
          widget.onRadialDragUpdate?.call(
            _getCoordinatesFromOffset(details.globalPosition),
          );
        }
      },
      onPanEnd: (DragEndDetails details) {
        if (widget.onRadialDragEnd != null) {
          widget.onRadialDragEnd?.call();
        }
      },
    );
  }

  Coordinates _getCoordinatesFromOffset(Offset offset) {
    final renderBox = context.findRenderObject() as RenderBox?;
    final localOffset = renderBox?.globalToLocal(offset);
    final localPoint = Point<double>(
      localOffset?.dx ?? 0,
      localOffset?.dy ?? 0,
    );

    final w = context.size?.width ?? 0;
    final h = context.size?.height ?? 0;

    final originPoint = Point<double>(w / 2, h / 2);
    return Coordinates.fromPoints(originPoint, localPoint);
  }
}

class Coordinates {
  Coordinates(this.angle, this.radius);

  factory Coordinates.fromPoints(
    Point<double> origin,
    Point<double> destination,
  ) {
    final point = destination - origin;
    final offset = Offset(point.x, point.y);

    return Coordinates(offset.direction, offset.distance);
  }

  final double angle;
  final double radius;
}
