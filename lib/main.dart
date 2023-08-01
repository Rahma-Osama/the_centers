import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_center/features/qr_code/presentation/views/qr_view.dart';

import 'constants.dart';
import 'features/log_in/presentation/view_model/bloc_observer.dart';
import 'features/log_in/presentation/view_model/body.dart';
import 'features/log_in/presentation/view_model/network.dart';
import 'features/log_in/presentation/views/log_in view.dart';
import 'features/qr_code/presentation/view_model/bodyqr.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheNetwork.cachInstialization();
  token=  await CacheNetwork.getCacheData(key: "token");
  print("tokkkkeeeeeennnnn : $token");
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
        home: token == "empty" ? const LoginView() : const QrView(),
      ),
    );
  }
}
