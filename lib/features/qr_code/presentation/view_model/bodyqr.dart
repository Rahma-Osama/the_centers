import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:the_center/features/qr_code/presentation/views/widgets/qr_done.dart';

import '../../../../constants.dart';
import '../views/widgets/qr_body.dart';
import 'network.dart';
import 'statesqr.dart';
import 'package:http/http.dart' as http;

class AuthCubitQr extends Cubit<AuthStatesQr> {
  AuthCubitQr() : super(IntialState());
  String? userNameData;
  void QrLogin({
    required String userName,
    required String password,
    required BuildContext context,
  }) async {
    emit(QrLoadingState());
    try {
      var url = Uri.parse(
          scannedQrCode.toString(),
      );
      print("111");


      Response response = await http.post(
        url,
        headers: {'Content-Type': 'application/json' , 'Authorization':token!},
        // body: requestBody,
      );
      print(response.statusCode);

      // var pref = await SharedPreferences.getInstance();
      if (response.statusCode == 200) {
        // var responseData = jsonDecode(response.body);
        print('cccccc');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QrDone(qrCode: scannedQrCode)),
        );
          emit(QrSuccessState());
          debugPrint("LogIN Succcessfully, token is : $token");

      }  else {
        emit(QrFailedState(message: "Incorrect Username or Password "));
        print("else");
      }
    } catch (e) {
      emit(QrFailedState(message: "Something went wrong, Try again later"));
      print("fgghh");
    }
  }
}