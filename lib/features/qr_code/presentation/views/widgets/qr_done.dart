import 'package:flutter/material.dart';
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
                      width: 300, // Set the desired width of the circle
                      height: 300, // Set the desired height of the circle
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue, // Set the desired color of the circle
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 200,
                      ),
                    ),
                    const SizedBox(
                      height: 57,
                    ),
                    const Text('Done'),
                  ],
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                child: Row(
                  children: [
                    ClipOval(
                      child: Container(
                        width: 40,
                        height: 40,
                        color: Colors.blue,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context); // Replace with the desired navigation action
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Attendance',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
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
