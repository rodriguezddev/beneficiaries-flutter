import 'package:flutter/material.dart';

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
          image: AssetImage('assets/images/logotipo.png'),
          width: 150.0,
        ),
      ),
    );
  }
}
