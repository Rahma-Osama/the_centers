import 'package:flutter/material.dart';
import 'package:the_center/features/qr_code/presentation/views/widgets/qr_body.dart';

class QrView extends StatelessWidget {
  const QrView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: QrBody(),
      ),
    );
  }
}
