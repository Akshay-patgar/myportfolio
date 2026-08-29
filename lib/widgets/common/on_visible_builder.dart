import 'package:flutter/material.dart';

/// Calls [builder] with `true` once the widget enters the viewport
/// (stays true afterwards). Useful to kick off one-shot animations.
class OnVisibleBuilder extends StatefulWidget {
  const OnVisibleBuilder({
    super.key,
    required this.builder,
    this.listenTo,
    this.triggerAt = 0.94,
  });

  final Widget Function(BuildContext context, bool visible) builder;
  final ScrollController? listenTo;
  final double triggerAt;

  @override
  State<OnVisibleBuilder> createState() => _OnVisibleBuilderState();
}

class _OnVisibleBuilderState extends State<OnVisibleBuilder> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    widget.listenTo?.addListener(_check);
  }

  @override
  void dispose() {
    widget.listenTo?.removeListener(_check);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) => _check());
  }

  void _check() {
    if (_visible || !mounted) return;
    final RenderObject? ro = context.findRenderObject();
    if (ro == null || ro is! RenderBox || !ro.attached || !ro.hasSize) return;

    final Size viewport = MediaQuery.sizeOf(context);
    final Offset pos = ro.localToGlobal(Offset.zero);
    if (pos.dy < viewport.height * widget.triggerAt &&
        pos.dy + ro.size.height > 0) {
      setState(() => _visible = true);
    }
  }

  @override
  Widget build(BuildContext context) =>
      widget.builder(context, _visible);
}
