import 'dart:math';

import 'package:flutter/material.dart';
import '../../../app/extensions.dart';

class BackSwivelAnimWidget extends StatefulWidget {
  const BackSwivelAnimWidget({
    super.key,
    required this.child,
    required this.durationMilliSec,
    this.delayMilliSec = 0,
    this.curve = Curves.linear,
    this.periodic = true,
    this.periodicDelay = 0,
  });

  final Widget child;
  final int durationMilliSec;
  final int delayMilliSec;
  final Curve curve;
  final bool periodic;
  final int periodicDelay;

  @override
  State<BackSwivelAnimWidget> createState() => _BackSwivelAnimWidgetState();
}

class _BackSwivelAnimWidgetState extends State<BackSwivelAnimWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final CurvedAnimation _backAnimation;
  late final CurvedAnimation _swivelAnimation;
  late final CurvedAnimation _frontAnimation;
  late final CurvedAnimation _bottomAnimation;

  double back = 1;
  double angle = 0;
  double bottom = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: widget.durationMilliSec.getMilliSec());

    _backAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Interval(0, 0.25, curve: widget.curve));
    _swivelAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.17, 0.95, curve: widget.curve));
    _frontAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.25, 1, curve: widget.curve));
    _bottomAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.05, 0.95, curve: widget.curve));

    if (widget.periodic) {
      _animationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reset();
        } else if (status == AnimationStatus.dismissed) {
          Future.delayed(widget.periodicDelay.getMilliSec()).then((value) {
            if (mounted) _animationController.forward(from: 0.0);
          });
        }
      });
    }
    Future.delayed(widget.delayMilliSec.getMilliSec()).then((value) {
      if (mounted) _animationController.forward();
    });
  }

  @override
  void dispose() {
    _backAnimation.dispose();
    _swivelAnimation.dispose();
    _frontAnimation.dispose();
    _bottomAnimation.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        back = ((_backAnimation.value + 1) - _frontAnimation.value) * 0.95;
        angle = _swivelAnimation.value * 2 * pi;
        bottom = (1 - pow(_bottomAnimation.value * 2 - 1, 2)) * 0.006;
        bottom = 0;
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4(
            1,
            0,
            0,
            0,
            0,
            1,
            0,
            bottom,
            0,
            0,
            1,
            0,
            0,
            0,
            0,
            back,
          )..rotateY(angle),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
