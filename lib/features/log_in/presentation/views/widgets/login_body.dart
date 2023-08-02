import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_center/core/shared_widget/custom_buttom.dart';
import 'package:the_center/core/shared_widget/default_text.dart';
import 'package:the_center/features/log_in/presentation/views/widgets/snack_bar.dart';
import '../../../../qr_code/presentation/views/qr_view.dart';
import '../../view_model/body.dart';
import '../../view_model/states.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool _remember = false;
  bool isPasswordVisible = false;
  bool? currentValue;
  var formKey = GlobalKey <FormState>();
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AuthCubit,AuthStates> (
      listener: (context, state){
        if(state is LogInSuccessState){
          Navigator.pop(context);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> QrView()));
        }

        else if(state is LogInFailedState){
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar (message: state.message!),
          );
        }
        else {
          showDialog(context: context, builder: (_)=>const AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(color: Colors.green,),
                SizedBox(width: 10,),
                Text("Loading..")
              ],
            ),
          ));
        }
      },
      builder: (context,state)=>
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child:
                          Image.asset(
                            'assets/images/icon.png',
                            height: MediaQuery.of(context).size.height*.3,
                          ),
                        ),
                        const Row(
                          children: [
                            Text(
                              'Welcome!',
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5,),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Log in to continue',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        defaultText(
                            type: TextInputType.emailAddress,
                          controller: emailController,
                          label: 'enter your email',
                          hint: 'your email',
                          prefix: Icons.person,
                          validate: ( value){
                            if (value!.isEmpty){
                              return 'Email must not be empty';
                            }
                            return null;
                          },
                          ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultText(
                            type: TextInputType.visiblePassword,
                          validate: (  value){
                            if (value!.isEmpty){
                              return 'password is too short';
                            }
                            return null;
                          },
                          controller: passwordController,
                          hint: 'Password',
                          label: 'enter your password',
                          prefix: Icons.lock,
                          suffix: isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          pressed: (){
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          isObscure: !isPasswordVisible,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Switch(
                              value: _remember,
                              onChanged: (newValue) async{
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                setState(() {
                                  _remember = newValue;
                                  prefs.setBool('remember', newValue);
                                });
                              },
                            ),
                            const Text('Remember me'),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomButton(
                          width: double.infinity,
                            backgroundColor: Colors.lightBlueAccent,
                            text: 'Sign in',
                            func: (){
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<AuthCubit>(context).logIn(
                                  userName: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            }
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );

  }
}
