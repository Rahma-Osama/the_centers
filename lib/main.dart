import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_center/features/log_in/presentation/views/log_in%20view.dart';
import 'package:the_center/features/qr_code/presentation/views/qr_view.dart';
import 'package:the_center/features/splash_screen/presentation/views/splash_view.dart';

import 'constants.dart';
import 'features/log_in/presentation/view_model/bloc_observer.dart';
import 'features/log_in/presentation/view_model/body.dart';
import 'features/log_in/presentation/view_model/network.dart';
import 'features/qr_code/presentation/view_model/bodyqr.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
    SharedPreferences prefs = await SharedPreferences.getInstance();
  await CacheNetwork.cachInstialization();
  remember = prefs.getBool('remember');
//remove await
  token=  await CacheNetwork.getCacheData(key: "token");

  debugPrint("tokkkkeeeeeennnnn : $token");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx)=>AuthCubit(),
        ),
        BlocProvider(
          create: (ctx)=>AuthCubitQr(),
        ),
      ],

      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: token != "empty" && remember==true? const  QrView(): const  SplashView() ,
      ),
    );
  }
}

