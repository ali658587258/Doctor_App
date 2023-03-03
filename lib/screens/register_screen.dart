import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/doctor/doctor_cubit.dart';
import '../componentes/my_button.dart';
import '../componentes/my_text_field.dart';
import '../enums/toast_state.dart';
import '../src/app_colors.dart';
import '../toast/toast_config.dart';
import '../utils/app_navigator.dart';
import 'home_screen.dart';
import 'login_screen.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit,DoctorState>(
        listener: (context,state){
          if(state is DoctorRegisterSuccess){
            ToastConfig.showToast(msg: 'Success', toastStates: ToastStates.Success);
            AppNavigator.navigateToNewScreen(context, HomeScreen(), true);
          }
          else if(state is DoctorRegisterError){
            ToastConfig.showToast(msg: 'Error', toastStates: ToastStates.Error);
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
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,

                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Expanded(
                      child: Column(
                        children: [
                          Text('Create Your Account',style: TextStyle(
                              fontSize: 20
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account?',style: TextStyle(color: Colors.grey[600]
                              )
                              ),
                              TextButton(onPressed: (){
                                AppNavigator.navigateToNewScreen(context, LoginScreen(), false);
                              }, child: Text('Login !'))
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyTextField(label: 'Name',controller: cubit.nameController,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyTextField(label: 'Email',controller: cubit.emailController,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyTextField(label: 'Password',isPassword: true,controller: cubit.passwordController,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyTextField(label: 'Title',controller: cubit.titleController,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyTextField(label: 'Address',controller: cubit.addressController,),
                          ),if(state is DoctorLoginLoading)

                            LinearProgressIndicator(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 30),
                            child: MyButton(text: 'Register', function: (){
                              cubit.register();
                            })
                          )

                        ],
                      ),
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
