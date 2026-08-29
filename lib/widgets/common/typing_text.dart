import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypingText extends StatefulWidget {
  const TypingText({
    super.key,
    required this.words,
    this.style,
    this.cursorColor,
    this.typeSpeed = const Duration(milliseconds: 75),
    this.deleteSpeed = const Duration(milliseconds: 40),
    this.holdDuration = const Duration(milliseconds: 1600),
  });

  final List<String> words;
  final TextStyle? style;
  final Color? cursorColor;
  final Duration typeSpeed;
  final Duration deleteSpeed;
  final Duration holdDuration;

  @override
  State<TypingText> createState() => _TypingTextState();
}

enum _Phase { typing, holding, deleting }

class _TypingTextState extends State<TypingText> {
  int _wordIndex = 0;
  int _charCount = 0;
  _Phase _phase = _Phase.typing;
  bool _cursorVisible = true;
  Timer? _timer;
  Timer? _blinkTimer;

  String get _currentWord => widget.words[_wordIndex % widget.words.length];
  String get _visibleText => _currentWord.substring(0, _charCount);

  @override
  void initState() {
    super.initState();
    _schedule();
    _blinkTimer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      if (mounted) setState(() => _cursorVisible = !_cursorVisible);
    });
  }

  void _schedule() {
    switch (_phase) {
      case _Phase.typing:
        if (_charCount < _currentWord.length) {
          _timer = Timer(widget.typeSpeed, () {
            if (!mounted) return;
            setState(() => _charCount++);
            _schedule();
          });
        } else {
          _timer = Timer(widget.holdDuration, () {
            if (!mounted) return;
            setState(() => _phase = _Phase.deleting);
            _schedule();
          });
        }
      case _Phase.holding:
        break;
      case _Phase.deleting:
        if (_charCount > 0) {
          _timer = Timer(widget.deleteSpeed, () {
            if (!mounted) return;
            setState(() => _charCount--);
            _schedule();
          });
        } else {
          _timer = Timer(const Duration(milliseconds: 300), () {
            if (!mounted) return;
            setState(() {
              _wordIndex = (_wordIndex + 1) % widget.words.length;
              _phase = _Phase.typing;
            });
            _schedule();
          });
        }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _blinkTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style =
        widget.style ?? Theme.of(context).textTheme.headlineMedium!;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: _visibleText, style: style),
          TextSpan(
            text: '_',
            style: style.copyWith(
              color: widget.cursorColor ?? style.color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.clip,
      softWrap: false,
    );
  }
}

/// Small helper for monospace code-style labels like `// about_me`.
class CodeLabel extends StatelessWidget {
  const CodeLabel(this.text, {super.key, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.jetBrainsMono(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.2,
        color: color ?? Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
