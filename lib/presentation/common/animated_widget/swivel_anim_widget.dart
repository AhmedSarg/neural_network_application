import 'dart:math';

import 'package:flutter/material.dart';
import '../../../app/extensions.dart';

class SwivelAnimWidget extends StatefulWidget {
  const SwivelAnimWidget(
      {super.key,
      required this.child,
      required this.durationMilliSec,
      this.delayMilliSec = 0,
      this.curve = Curves.linear,
      this.periodic = true});

  final Widget child;
  final int durationMilliSec;
  final int delayMilliSec;
  final Curve curve;
  final bool periodic;

  @override
  State<SwivelAnimWidget> createState() => _SwivelAnimWidgetState();
}

class _SwivelAnimWidgetState extends State<SwivelAnimWidget>
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

    if (widget.periodic) {
      _animationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.forward(from: 0.0);
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward(from: 0.0);
        }
      });
    }
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
        return Transform( alignment: Alignment.center,
          transform: Matrix4.rotationY(2 * pi * _curvedAnimation.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
