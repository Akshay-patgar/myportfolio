import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Card with hover lift, glowing accent border and subtle 3D tilt
/// (tilt only reacts to real mouse pointers — touch is unaffected).
class GlowCard extends StatefulWidget {
  const GlowCard({
    super.key,
    required this.child,
    this.accent = AppColors.cyan,
    this.padding = const EdgeInsets.all(24),
    this.radius = 16,
    this.enableTilt = true,
  });

  final Widget child;
  final Color accent;
  final EdgeInsetsGeometry padding;
  final double radius;
  final bool enableTilt;

  @override
  State<GlowCard> createState() => _GlowCardState();
}

class _GlowCardState extends State<GlowCard> {
  bool _hovering = false;
  Offset _pointer = Offset.zero;
  Size _size = Size.zero;

  void _onHover(PointerHoverEvent e) {
    setState(() {
      _hovering = true;
      _pointer = e.localPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      onHover: widget.enableTilt ? _onHover : null,
      child: LayoutBuilder(
        builder: (context, constraints) {
          _size = constraints.biggest;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            transformAlignment: Alignment.center,
            transform: _buildTiltMatrix(),
            padding: widget.padding,
            decoration: BoxDecoration(
              color: AppColors.surfaceAlt,
              borderRadius: BorderRadius.circular(widget.radius),
              border: Border.all(
                color: _hovering
                    ? widget.accent.withValues(alpha: 0.55)
                    : AppColors.border,
              ),
              boxShadow: _hovering
                  ? [
                      BoxShadow(
                        color: widget.accent.withValues(alpha: 0.18),
                        blurRadius: 28,
                        offset: const Offset(0, 12),
                      ),
                    ]
                  : const [],
            ),
            child: widget.child,
          );
        },
      ),
    );
  }

  Matrix4 _buildTiltMatrix() {
    if (!_hovering || !widget.enableTilt || _size == Size.zero) {
      return Matrix4.identity()..translateByDouble(0, -2, 0, 1);
    }
    final double dx = (_pointer.dx / _size.width - 0.5).clamp(-1.0, 1.0);
    final double dy = (_pointer.dy / _size.height - 0.5).clamp(-1.0, 1.0);
    return Matrix4.identity()
      ..translateByDouble(0, -6, 0, 1)
      ..rotateX(dy * -0.05)
      ..rotateY(dx * 0.05);
  }
}
