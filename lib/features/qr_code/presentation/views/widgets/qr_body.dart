import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:the_center/features/qr_code/presentation/views/widgets/qr_done.dart';

import '../../../../log_in/presentation/views/widgets/snack_bar.dart';
import '../../view_model/bodyqr.dart';
import '../../view_model/statesqr.dart';

class QrBody extends StatefulWidget {
  const QrBody({Key? key}) : super(key: key);

  @override
  State<QrBody> createState() => _QrBodyState();
}
String scannedQrCode = '';
class _QrBodyState extends State<QrBody> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? barCode;
  QRViewController? controller;
  String qrText = '';
  // to store url
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isLoginInProgress = false; // Add this flag

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller! .pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubitQr,AuthStatesQr>(
      listener: (context, state){
        if(state is QrSuccessState){
          Navigator.pop(context);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> QrDone(qrCode: scannedQrCode)));
        }
        else if (state is QrFailedState){
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar (message: state.message!),
          );
        }
      },
      builder: (context,state)
      => Stack(
          alignment: Alignment.center,
          children: [
            buildQRView(context),
            Positioned(
              bottom: 10.0,
              child: buildResult(),
            ),
            Positioned(
              top: 10.0,
              child: buildControlButton(),
            ),
          ],
        )
    );
  }
  Widget buildQRView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        //cutout
        borderRadius: 10,
        borderLength: 20,
        borderWidth: 10,
        cutOutSize: MediaQuery.of(context).size.width * .8,
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((barCode) {
      if (!isLoginInProgress && barCode.code != null) { // Check if login is not already in progress
        setState(() {
          this.barCode = barCode;
          scannedQrCode = barCode.code!;
          print('Scanned QR Code: $scannedQrCode');
          isLoginInProgress = true; // Set the flag to indicate login is in progress
          BlocProvider.of<AuthCubitQr>(context).QrLogin(
            userName: emailController.text,
            password: passwordController.text,
            context: context,
          );
        });
      }
    });
  }

  Widget buildResult() =>
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white24,
        ),
        child: Text(
          barCode != null ? 'Result : ${barCode!.code}' : 'Scan a code !',
          maxLines: 3,
        ),
      );

  buildControlButton() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white24,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () async {
            await controller?.toggleFlash();
            setState(() {

            });
          },
          icon: FutureBuilder<bool?>(
            future: controller?.getFlashStatus(),
            builder: (context , snapshot){
              if(snapshot.data != null ){
                return Icon(
                    snapshot.data! ? Icons.flash_on : Icons.flash_off);
              } else {
                return Container();
              }
            },
          ),

        ),
        IconButton(onPressed: () async {
          await controller?.flipCamera();
          setState(() {

          });
        },
          icon:
          FutureBuilder(
            future: controller?.getCameraInfo(),
            builder: (context , snapshot){
              if(snapshot.data != null ){
                return const Icon(
                    Icons.switch_camera_outlined );
              } else {
                return Container();
              }
            },
          ),

        ),
      ],
    ),
  );
}

