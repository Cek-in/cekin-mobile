import 'package:flutter/material.dart';

class TabBarIndicator extends BoxDecoration {
  final Color colour;
  const TabBarIndicator({
    required this.colour,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _IndicatorPainter(colour, onChanged);
  }
}

class _IndicatorPainter extends BoxPainter {
  final Paint _paint;

  _IndicatorPainter(Color color, VoidCallback? onChanged)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true,
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final RRect rrect = RRect.fromRectAndRadius(
        Rect.fromLTWH(
          offset.dx + cfg.size!.width / 9,
          cfg.size!.height / 1.3,
          cfg.size!.width - 2 * (cfg.size!.width / 9),
          cfg.size!.height / 8,
        ),
        Radius.circular(5));
    canvas.drawRRect(rrect, _paint);
    // final Offset circleOffset =
    //     offset + Offset(cfg.size!.width / 2, cfg.size!.height - 15 - 5);
    // canvas.drawCircle(circleOffset, 15, _paint);
  }
}
