import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:the_center/constants.dart';
import 'package:the_center/features/log_in/presentation/views/log_in%20view.dart';


class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 10), () {
      Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginView()),
              );
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 1000,
      height: 1000,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        image: DecorationImage(
          image: AssetImage('assets/images/back.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset('assets/images/cap.png'),
          ),
          SizedBox(height: 20,),
          Flexible(
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(
                    'The Center' ,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontFamily: 'Socake',
                      fontWeight: FontWeight.w400,
                      height: 0.46,
                      letterSpacing: -0.24,
                    ),
                  ),
                ],
                isRepeatingAnimation: true,
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


