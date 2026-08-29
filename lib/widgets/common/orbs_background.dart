import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Animated hero background: drifting gradient orbs + faint dot grid.
class OrbsBackground extends StatefulWidget {
  const OrbsBackground({super.key, this.child});

  final Widget? child;

  @override
  State<OrbsBackground> createState() => _OrbsBackgroundState();
}

class _OrbsBackgroundState extends State<OrbsBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 14),
  )..repeat(reverse: true);

  late final Animation<double> _t = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(child: _Backdrop(t: _t)),
        if (widget.child != null) widget.child!,
      ],
    );
  }
}

/// Fills the parent stack with the drifting orbs + dot grid, clipped to size.
class _Backdrop extends StatelessWidget {
  const _Backdrop({required this.t});

  final Animation<double> t;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        fit: StackFit.expand,
        children: [
          const CustomPaint(painter: _DotGridPainter()),
          AnimatedBuilder(
            animation: t,
            builder: (context, _) => Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.hardEdge,
              children: [
                Align(
                  alignment: Alignment.lerp(
                    const Alignment(-0.9, -0.7),
                    const Alignment(0.2, -0.4),
                    t.value,
                  )!,
                  child: _orb(AppColors.cyan, 420, 0.16),
                ),
                Align(
                  alignment: Alignment.lerp(
                    const Alignment(1.1, 0.6),
                    const Alignment(0.4, 0.2),
                    t.value,
                  )!,
                  child: _orb(AppColors.violet, 480, 0.14),
                ),
                Align(
                  alignment: Alignment.lerp(
                    const Alignment(0.5, 1.3),
                    const Alignment(-0.5, 0.9),
                    t.value,
                  )!,
                  child: _orb(AppColors.emerald, 360, 0.10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _orb(Color color, double size, double opacity) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [color.withValues(alpha: opacity), color.withValues(alpha: 0)],
          ),
        ),
      ),
    );
  }
}

class _DotGridPainter extends CustomPainter {
  const _DotGridPainter();

  @override
  void paint(Canvas canvas, Size size) {
    const double spacing = 32;
    final Paint paint = Paint()
      ..color = AppColors.textPrimary.withValues(alpha: 0.05)
      ..strokeWidth = 1;
    for (double x = spacing / 2; x < size.width; x += spacing) {
      for (double y = spacing / 2; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Rotating dashed ring used around the profile photo.
class RotatingRing extends StatefulWidget {
  const RotatingRing({super.key, required this.size, this.color});

  final double size;
  final Color? color;

  @override
  State<RotatingRing> createState() => _RotatingRingState();
}

class _RotatingRingState extends State<RotatingRing>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 24),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: CustomPaint(
        size: Size.square(widget.size),
        painter: _DashedCirclePainter(color: widget.color ?? AppColors.cyan),
      ),
    );
  }
}

class _DashedCirclePainter extends CustomPainter {
  const _DashedCirclePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Rect rect = Rect.fromCircle(center: size.center(Offset.zero), radius: radius);
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = color;

    const int dashes = 48;
    const double gapRatio = 0.45;
    final double sweep = 2 * math.pi / dashes;
    for (int i = 0; i < dashes; i++) {
      final double start = i * sweep;
      canvas.drawArc(rect, start, sweep * (1 - gapRatio), false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _DashedCirclePainter oldDelegate) =>
      oldDelegate.color != color;
}
