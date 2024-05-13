import 'package:flutter/material.dart';
import '../../../app/extensions.dart';

class ZoomInZoomOutAnimWidget extends StatefulWidget {
  const ZoomInZoomOutAnimWidget(
      {super.key,
      required this.child,
      required this.durationMilliSec,
      this.delayMilliSec = 0,
      this.curve = Curves.linear});

  final Widget child;
  final int durationMilliSec;
  final int delayMilliSec;
  final Curve curve;

  @override
  State<ZoomInZoomOutAnimWidget> createState() =>
      _ZoomInZoomOutAnimWidgetState();
}

class _ZoomInZoomOutAnimWidgetState extends State<ZoomInZoomOutAnimWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: widget.durationMilliSec.getMilliSec());

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

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
        return Transform.scale(
          alignment: Alignment.center,
          scale: ((_curvedAnimation.value) * 0.25 + 0.75) * 1.5,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
