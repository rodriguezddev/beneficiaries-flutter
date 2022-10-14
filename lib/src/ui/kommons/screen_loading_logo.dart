import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../core/utils/utils.dart';
import 'logo_screen.dart';

class ScreenLoadingLogo extends StatefulWidget {
  final bool isWeb;
  const ScreenLoadingLogo({
    Key? key,
    this.isWeb = false,
  }) : super(key: key);

  @override
  _ScreenLoadingLogo createState() => _ScreenLoadingLogo();
}

class _ScreenLoadingLogo extends State<ScreenLoadingLogo>
    with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _controller?.addListener(
      () {
        if (_controller!.isCompleted) {
          _controller!.repeat();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller?.forward();
    return Scaffold(
      body: !kIsWeb
        ? AnnotatedRegion<SystemUiOverlayStyle>(
          value: Utils.darkSystemUiOverlayStyle(),
          child: LogoScreen(
            controller: _controller!,
          ),
        )
        : LogoScreen(
           controller: _controller!,
        ),
    );
  }
}
