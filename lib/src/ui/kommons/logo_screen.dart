import 'package:flutter/material.dart';
import 'package:internal_benefits_library/src/core/constants/asset_constants.dart';

class LogoScreen extends StatelessWidget {
  final AnimationController controller;

  const LogoScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(controller),
        child: const Image(
          image: AssetImage(AssetConstants.logo),
          width: 150.0,
        ),
      ),
    );
  }
}
