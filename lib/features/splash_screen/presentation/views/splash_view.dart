import 'package:flutter/material.dart';
import 'package:the_center/features/splash_screen/presentation/views/widgets/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SplashBody(),
      ),
    );
  }
}
