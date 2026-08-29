import 'package:flutter/material.dart';

/// Reveals [child] with a fade + slide once it enters the viewport.
/// Listens to [listenTo] (a ScrollController) to re-check position,
/// and only animates forward once (stays revealed afterwards).
class RevealOnScroll extends StatefulWidget {
  const RevealOnScroll({
    super.key,
    required this.child,
    this.listenTo,
    this.delay = Duration.zero,
    this.offset = const Offset(0, 0.06),
    this.duration = const Duration(milliseconds: 600),
  });

  final Widget child;
  final ScrollController? listenTo;
  final Duration delay;
  final Offset offset;
  final Duration duration;

  @override
  State<RevealOnScroll> createState() => _RevealOnScrollState();
}

class _RevealOnScrollState extends State<RevealOnScroll>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );
  bool _revealed = false;

  @override
  void initState() {
    super.initState();
    widget.listenTo?.addListener(_check);
  }

  @override
  void dispose() {
    widget.listenTo?.removeListener(_check);
    _controller.dispose();
    super.dispose();
  }

  void _check() {
    if (_revealed || !mounted) return;
    final RenderObject? ro = context.findRenderObject();
    if (ro == null || ro is! RenderBox || !ro.attached || !ro.hasSize) return;

    final Size viewport = MediaQuery.sizeOf(context);
    final Offset pos = ro.localToGlobal(Offset.zero);
    final double triggerY = viewport.height * 0.94;

    // Visible if any part of the box is above the trigger line.
    if (pos.dy < triggerY && pos.dy + ro.size.height > 0) {
      _revealed = true;
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) => _check());
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
    return FadeTransition(
      opacity: curve,
      child: SlideTransition(
        position: Tween<Offset>(begin: widget.offset, end: Offset.zero)
            .animate(curve),
        child: widget.child,
      ),
    );
  }
}
