import 'package:flutter/material.dart';
import '../../../app/extensions.dart';
import '../../resources/language_manager.dart';

class ShiftAnimWidget extends StatefulWidget {
  const ShiftAnimWidget({
    super.key,
    required this.child,
    required this.durationMilliSec,
    this.delayMilliSec = 0,
    this.curve = Curves.linear,
  });

  final Widget child;
  final int durationMilliSec;
  final int delayMilliSec;
  final Curve curve;

  @override
  State<ShiftAnimWidget> createState() => _ShiftAnimWidgetState();
}

class _ShiftAnimWidgetState extends State<ShiftAnimWidget>
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
        return Transform.translate(
          offset: AppLanguages.getCurrentTextDirection(context) == TextDirection.ltr
              ? Offset(-1 * context.width() * (1 - _curvedAnimation.value), 0)
              : Offset(1 * context.width() * (1 - _curvedAnimation.value), 0),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
