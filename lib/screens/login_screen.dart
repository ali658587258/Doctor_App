import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session2_1/screens/add_new_patient.dart';
import 'package:session2_1/screens/register_screen.dart';
import '../blocs/doctor/doctor_cubit.dart';
import '../componentes/my_button.dart';
import '../componentes/my_text_field.dart';
import '../enums/toast_state.dart';
import '../src/app_colors.dart';
import '../toast/toast_config.dart';
import '../utils/app_navigator.dart';
import 'home_screen.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit,DoctorState>(
        listener: (context,state){
          if(state is DoctorLoginSuccess){
            AppNavigator.navigateToNewScreen(context, HomeScreen(), true);
            ToastConfig.showToast(msg: 'Success', toastStates: ToastStates.Success);
          }
          else if(state is DoctorLoginError){
            ToastConfig.showToast(msg: 'Error', toastStates:ToastStates.Error );
          }
        },
        builder: (context,state){
          var cubit = DoctorCubit.get(context);
          return Scaffold(


            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.kMainColors ,
              title: Text('Doctor app'.toUpperCase(),style: TextStyle(fontSize: 25),),
              centerTitle: true,
            ),
            backgroundColor: AppColors.kMainColors,
            body:Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 40
              ),
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,

                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Text('Welcome!'.toUpperCase(),style: TextStyle(
                            fontSize: 20
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Dont have an account?',style: TextStyle(color: Colors.grey[600]
                            )
                            ),
                            TextButton(onPressed: (){
                              AppNavigator.navigateToNewScreen(context, RegisterScreen(), true);
                            }, child: Text('Register !'))
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyTextField(label: 'Email',controller: cubit.emailController,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyTextField(label: 'Password',isPassword: true,controller: cubit.passwordController,)
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        if(state is DoctorLoginLoading)
                          LinearProgressIndicator(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 30),
                          child: MyButton(text: 'Login', function: (){
                            cubit.login();
                          })
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
    );

  }
}
