import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session2_1/blocs/doctor/doctor_cubit.dart';
import '../componentes/information_card.dart';
import '../src/app_colors.dart';
import 'home_screen.dart';

class Accounts extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit,DoctorState>(builder: (context,state){
      var cubit = DoctorCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kMainColors,
          leading: Image.network('https://img.freepik.com/free-vector/turquoise-hospital-logo-template_1057-395.jpg'),
          title: Text('My Account',style: TextStyle(fontSize: 20),),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage('https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg'),
                  radius: 45,
                ),
                Text(cubit.nameController.toString(),style: TextStyle(fontWeight: FontWeight.w500),),
                Text(cubit.titleController.toString(),style: TextStyle(fontWeight: FontWeight.w300),),
                SizedBox(
                  height: 70,
                ),
                InformationCard(iconData: Icons.phone, text: '010265854585'),
                InformationCard(iconData: Icons.email, text: cubit.emailController.toString()),
                InformationCard(iconData: Icons.wallet_travel, text: cubit.addressController.toString()),
                SizedBox(
                  height: 60,
                ),
                SizedBox(
                  width: 400,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                  },
                      child: Text('BACK',)
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }, listener: (context,state){});
  }
}
