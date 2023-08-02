import 'package:flutter/material.dart';
import 'package:the_center/constants.dart';
import 'package:the_center/core/shared_widget/custom_buttom.dart';
import 'package:the_center/features/qr_code/presentation/views/qr_view.dart';
import 'package:the_center/features/qr_code/presentation/views/widgets/qr_result.dart';


class QrDone extends StatefulWidget {
  final String qrCode;

  const QrDone({Key? key, required this.qrCode}) : super(key: key);

  @override
  State<QrDone> createState() => _QrDoneState();
}

class _QrDoneState extends State<QrDone> {
  @override
  // void initState() {
  //   super.initState();
  //   navigateToNextPage();
  // }

  // void navigateToNextPage() {
  //   Future.delayed(const Duration(seconds: 3), () {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => const QrResult()),
  //     );
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50 , left: 10),
          child: Stack(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor, // Set the desired color of the circle
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 200,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Done',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomButton(
                        backgroundColor: kPrimaryColor,
                        text: 'Scan Again',
                        func: (){
                          Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const QrView()),
                                  );
                        }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
