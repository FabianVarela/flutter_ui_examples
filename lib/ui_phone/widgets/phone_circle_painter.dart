part of '../phone_ui.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Layers (bottom → top):
//  [A] Outer border                     — static
//  [B] Black donut + numbers            — static
//  [C] White pin                        — static
//  [D] White arc with gaps              — ROTATE
// ─────────────────────────────────────────────────────────────────────────────

class _RotaryDialPainter extends CustomPainter {
  const _RotaryDialPainter({required this.rotationRad, required this.vState});

  final double rotationRad;
  final ValidationState vState;

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final R = size.width / 2;
    final bW = R * 0.028;

    final dialR = R - bW;
    final innerR = R * 0.52;

    final holeR = R * 0.125;
    final orbitR = (dialR + innerR) / 2;

    // ── [A]
    canvas.drawCircle(
      c,
      dialR,
      Paint()
        ..color = Colors.black
        ..style = .stroke
        ..strokeWidth = bW * 2.0,
    );

    // ── [B]
    final donut = Path()
      ..addOval(Rect.fromCircle(center: c, radius: dialR))
      ..addOval(Rect.fromCircle(center: c, radius: innerR))
      ..fillType = .evenOdd;

    canvas.drawPath(donut, Paint()..color = Colors.black);

    for (final e in _kDigitAngleDeg.entries) {
      final centre = Offset(
        c.dx + orbitR * math.cos(_deg2rad(e.value - 90)),
        c.dy + orbitR * math.sin(_deg2rad(e.value - 90)),
      );

      final tp = TextPainter(
        text: TextSpan(
          text: e.key.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: holeR * 1.2,
            fontWeight: .w800,
          ),
        ),
        textDirection: .ltr,
      )..layout();
      tp.paint(canvas, centre - Offset(tp.width / 2, tp.height / 2));
    }

    // ── [C]
    final pinRad = _deg2rad(_kPinDeg - 100);
    canvas
      ..drawCircle(
        Offset(
          c.dx + orbitR * math.cos(pinRad),
          c.dy + orbitR * math.sin(pinRad),
        ),
        holeR * .55,
        Paint()..color = Colors.white,
      )
      // ── [D]
      ..save()
      ..translate(c.dx, c.dy)
      ..rotate(rotationRad)
      ..translate(-c.dx, -c.dy);
    _drawWhiteArc(canvas, c, dialR, innerR, holeR, orbitR);
    canvas.restore();
  }

  void _drawWhiteArc(
    Canvas canvas,
    Offset c,
    double dialR,
    double innerR,
    double holeR,
    double orbitR,
  ) {
    final startRad = _deg2rad(_kWhiteArcStartDeg - 90);
    final sweepRad = _deg2rad(_kWhiteArcSweepDeg);

    final outerR = dialR * 0.998;
    final innerRadiusArc = innerR * 1.050;

    final thickness = outerR - innerRadiusArc;
    final midRadius = (outerR + innerRadiusArc) / 2;
    final capRadius = thickness / 2;

    final arcPath = Path()
      ..arcTo(
        Rect.fromCircle(center: c, radius: outerR),
        startRad,
        sweepRad,
        false,
      );

    final endAngle = startRad + sweepRad;
    final endCenter = Offset(
      c.dx + midRadius * math.cos(endAngle),
      c.dy + midRadius * math.sin(endAngle),
    );

    arcPath
      ..arcTo(
        Rect.fromCircle(center: endCenter, radius: capRadius),
        endAngle,
        math.pi,
        false,
      )
      ..arcTo(
        Rect.fromCircle(center: c, radius: innerRadiusArc),
        endAngle,
        -sweepRad,
        false,
      );

    final startCenter = Offset(
      c.dx + midRadius * math.cos(startRad),
      c.dy + midRadius * math.sin(startRad),
    );

    arcPath
      ..arcTo(
        Rect.fromCircle(center: startCenter, radius: capRadius),
        startRad + math.pi,
        math.pi,
        false,
      )
      ..close();

    for (final e in _kDigitAngleDeg.entries) {
      final rad = _deg2rad(e.value - 90);
      final centre = Offset(
        c.dx + orbitR * math.cos(rad),
        c.dy + orbitR * math.sin(rad),
      );
      arcPath.addOval(Rect.fromCircle(center: centre, radius: holeR * 1.05));
    }

    arcPath.fillType = .evenOdd;
    canvas.drawPath(arcPath, Paint()..color = Colors.white);

    final stroke = Paint()
      ..color = Colors.black
      ..style = .stroke
      ..strokeCap = .round;

    canvas
      ..drawArc(
        Rect.fromCircle(center: c, radius: dialR * 0.998),
        startRad,
        sweepRad,
        false,
        stroke,
      )
      ..drawArc(
        Rect.fromCircle(center: c, radius: innerR * 1.050),
        startRad,
        sweepRad,
        false,
        stroke,
      );
  }

  @override
  bool shouldRepaint(_RotaryDialPainter old) =>
      old.rotationRad != rotationRad || old.vState != vState;
}

enum ValidationState { idle, success, failure }
