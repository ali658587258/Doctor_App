import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session2_1/blocs/add_patient/add_patient_cubit.dart';
import 'package:session2_1/blocs/delete_patient/delete_patient_cubit.dart';
import 'package:session2_1/blocs/edit_patient/edit_patient_cubit.dart';
import 'package:session2_1/blocs/get_all_patient/get_all_patient_cubit.dart';
import 'package:session2_1/blocs/show_patient/show_patient_cubit.dart';
import 'package:session2_1/screens/login_screen.dart';

import '../blocs/doctor/doctor_cubit.dart';

class AppRoot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>DoctorCubit()),
        BlocProvider(create: (context)=>ShowPatientCubit()),
        BlocProvider(create: (context)=>GetAllPatientCubit()..getAllPatient()),
        BlocProvider(create: (context)=>AddPatientCubit()),
        BlocProvider(create: (context)=>EditPatientCubit()),
        BlocProvider(create: (context)=>DeletePatientCubit()),

      ],
      child: MaterialApp(
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,

      ),
    );
  }
}
