import 'package:flutter/material.dart';
import 'package:the_center/constants.dart';
import 'package:the_center/core/utilies/styles.dart';
import 'package:the_center/features/log_in/presentation/views/widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double leftPosition = screenWidth >= 600 ? 50 : 20;

    double topPosition = screenWidth >= 600 ? 100 : 130;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              CustomPaint(
                painter: ShapesPainter(),
                child: ClipPath(
                  clipper: ShapeClipper(), // Use the custom clipper to clip the image
                  child: Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Ellipse 3934.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: topPosition,
                left: leftPosition,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/cap.png', width: 100, height: 100),
                    SizedBox(height: 20),
                    Text('Welcome', style: Styles.textStyle32),
                    SizedBox(height: 20),
                    Text('Log in to Continue', style: Styles.textStyle32),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 400),
                  LoginBody(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const double _kCurveHeight = 35;

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Path();
    p.lineTo(0, size.height - _kCurveHeight);
    p.relativeQuadraticBezierTo(
        size.width / 2, 2 * _kCurveHeight, size.width, 0);
    p.lineTo(size.width, 0);
    p.close();

    canvas.drawPath(p, Paint()..color = kPrimaryColor.withOpacity(0.6)); // Use opacity to make it transparent
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - _kCurveHeight);
    path.relativeQuadraticBezierTo(size.width / 2, 2 * _kCurveHeight, size.width, 0);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
