import 'package:flutter/material.dart';
import '../../../app/extensions.dart';

class ShiftedFadeInAnimWidget extends StatefulWidget {
  const ShiftedFadeInAnimWidget(
      {super.key,
      required this.child,
      required this.durationMilliSec,
      this.delayMilliSec = 0,
      this.curve = Curves.linear,
      required this.verticalShift});

  final Widget child;
  final int durationMilliSec;
  final int delayMilliSec;
  final Curve curve;
  final double verticalShift;

  @override
  State<ShiftedFadeInAnimWidget> createState() =>
      _ShiftedFadeInAnimWidgetState();
}

class _ShiftedFadeInAnimWidgetState extends State<ShiftedFadeInAnimWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: widget.durationMilliSec.getMilliSec());

    _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: widget.curve);

    Future.delayed(widget.delayMilliSec.getMilliSec()).then((value) {
      if (mounted) _animationController.forward();
    });
  }

  @override
  void dispose() {
    _curvedAnimation.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Opacity(
          opacity: _curvedAnimation.value,
          child: Transform.translate(
              offset: Offset(
                  0, (1 - _curvedAnimation.value) * widget.verticalShift),
              child: child),
        );
      },
      child: widget.child,
    );
  }
}
