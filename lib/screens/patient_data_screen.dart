
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session2_1/blocs/doctor/doctor_cubit.dart';
import 'package:session2_1/blocs/show_patient/show_patient_cubit.dart';
import 'package:session2_1/screens/edit_patient_screen.dart';
import 'package:session2_1/screens/home_screen.dart';
import 'package:session2_1/utils/app_navigator.dart';

import '../src/app_colors.dart';


class PatientDataScreen extends StatefulWidget {
  final int id;
  PatientDataScreen({required this.id});


  @override
  State<PatientDataScreen> createState() => _PatientDataScreenState();
}

class _PatientDataScreenState extends State<PatientDataScreen> {

  void initState() {
    ShowPatientCubit.get(context).showPatient(id: widget.id);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var cubit = ShowPatientCubit.get(context);
    return BlocConsumer<ShowPatientCubit,ShowPatientState>(builder: (context,state){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          leading: Image.network('https://img.freepik.com/free-vector/turquoise-hospital-logo-template_1057-395.jpg'),
          title: Text('My Account',style: TextStyle(fontSize: 20),),
        ),
        body: cubit.showPatientModel == null ?
        Center(child: CircularProgressIndicator(
          color: Colors.red,
        ),):
        Center(
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage('https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg'),
                      radius: 40,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Text(cubit.showPatientModel!.data!.name!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(onPressed: (){}, child: Text('MEDICAL HISTORY'))
                      ],
                    ),

                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  children: [
                    Icon(Icons.date_range),
                    Text('  ${cubit.showPatientModel!.data!.dateOfBirth!}'),
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Row(
                  children: [
                    Icon(Icons.visibility),
                    Text('  ${cubit.showPatientModel!.data!.visitTime!}')
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Row(
                  children: [
                    Icon(Icons.location_on),
                    Text('  ${cubit.showPatientModel!.data!.address!}'),
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Row(
                  children: [
                    Icon(Icons.description),
                    Text('  ${cubit.showPatientModel!.data!.diagnosis!}'),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 120,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: (){},
                          child: Text('STRRT PROCEDURES'),
                        )
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                        width: 120,
                        height: 40,
                        child: ElevatedButton
                          (
                            onPressed: (){
                              AppNavigator.navigateToNewScreen(context, EditPatientScreen(id: cubit.showPatientModel!.data!.id!), false);
                            },
                            child:  Text('EDIT')
                        )
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    SizedBox(
                        width: 120,
                        height: 40,
                        child: ElevatedButton
                          (
                            onPressed: (){
                              AppNavigator.navigateToNewScreen(context, HomeScreen(), false);
                            },
                            child:  Text('BACK')
                        )
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                        width: 120,
                        height: 40,
                        child: ElevatedButton
                          (
                            onPressed: (){},
                            child:  Text('PATIENT MISSING')
                        )
                    ),
                  ],
                )

              ],
            ),
          ),
        ),
      );
    }, listener: (context,state){});
  }
}