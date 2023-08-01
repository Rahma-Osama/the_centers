import 'package:flutter/material.dart';
import 'package:the_center/features/log_in/presentation/views/widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
      body: LoginBody(),
      ),
    );
  }
}
