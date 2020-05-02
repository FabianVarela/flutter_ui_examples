import 'dart:math';

import 'package:flutter/material.dart';

class CustomGestureDetectorRadial extends StatefulWidget {
  CustomGestureDetectorRadial({
    @required this.child,
    this.onRadialDragStart,
    this.onRadialDragUpdate,
    this.onRadialDragEnd,
  });

  final Widget child;
  final RadialDragStart onRadialDragStart;
  final RadialDragUpdate onRadialDragUpdate;
  final RadialDragEnd onRadialDragEnd;

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
        if (widget.onRadialDragStart != null)
          widget.onRadialDragStart(
            _getCoordinatesFromOffset(details.globalPosition),
          );
      },
      onPanUpdate: (DragUpdateDetails details) {
        if (widget.onRadialDragUpdate != null)
          widget.onRadialDragUpdate(
            _getCoordinatesFromOffset(details.globalPosition),
          );
      },
      onPanEnd: (DragEndDetails details) {
        if (widget.onRadialDragEnd != null) {
          widget.onRadialDragEnd();
        }
      },
    );
  }

  Coordinates _getCoordinatesFromOffset(Offset offset) {
    final Offset localOffset =
        (context.findRenderObject() as RenderBox).globalToLocal(offset);
    final Point<double> localPoint =
        Point<double>(localOffset.dx, localOffset.dy);
    final Point<double> originPoint =
        Point<double>(context.size.width / 2, context.size.height / 2);

    return Coordinates.fromPoints(originPoint, localPoint);
  }
}

class Coordinates {
  Coordinates(this.angle, this.radius);

  final double angle;
  final double radius;

  factory Coordinates.fromPoints(
      Point<double> origin, Point<double> destination) {
    final Point<double> point = destination - origin;
    final Offset offset = Offset(point.x, point.y);

    return Coordinates(offset.direction, offset.distance);
  }
}

typedef RadialDragStart = Function(Coordinates startCoords);
typedef RadialDragUpdate = Function(Coordinates updateCoords);
typedef RadialDragEnd = Function();
