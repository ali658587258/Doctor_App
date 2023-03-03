
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session2_1/blocs/delete_patient/delete_patient_cubit.dart';
import 'package:session2_1/blocs/get_all_patient/get_all_patient_cubit.dart';
import 'package:session2_1/blocs/show_patient/show_patient_cubit.dart';
import 'package:session2_1/screens/patient_data_screen.dart';
import '../blocs/doctor/doctor_cubit.dart';
import '../src/app_colors.dart';
import '../utils/app_navigator.dart';
import 'accounts.dart';
import 'add_new_patient.dart';
import 'login_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    GetAllPatientCubit.get(context).getAllPatient();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllPatientCubit,GetAllPatientState>(builder: (context,state){
      var cubit= GetAllPatientCubit.get(context);
      var cubitDelete= DeletePatientCubit.get(context);
      var cubitRefresh= DoctorCubit.get(context);


      return
        Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.person_add_sharp),
            onPressed: (){
              AppNavigator.navigateToNewScreen(context, AddNewPatient(), false) ;
              },
          ),
          appBar: AppBar(
            actions: [
            IconButton(onPressed: (){
              AppNavigator.navigateToNewScreen(context, LoginScreen(), true);
              }, icon: Icon(Icons.logout,
          color: Colors.red[600],
            ))
            ],
            leading: Image.network('https://img.freepik.com/free-vector/turquoise-hospital-logo-template_1057-395.jpg'),
            title: Text('Appointments',style: TextStyle(fontSize: 20),),
          ),
          body:
          cubit.allPatientRequest==null?
          Center(child: CircularProgressIndicator(
            color: Colors.red,
          ),):
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount:cubit.allPatientRequest!.data!.data!.length ,
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      onTap: (){
                        AppNavigator.navigateToNewScreen(context, PatientDataScreen(id: cubit.allPatientRequest!.data!.data![index].id!,), false);

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          elevation: 6,
                          child: IntrinsicWidth(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20.0,left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(cubit.allPatientRequest!.data!.data![index].name!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                            ),
                                          ),
                                        ),
                                        IconButton(onPressed: (){
                                          cubitDelete.deletePatient(id: cubit.allPatientRequest!.data!.data![index].id!);
                                          cubitRefresh.refresh();
                                        }, icon: Icon(Icons.delete))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                    child: Row(
                                      children: [
                                        Icon(Icons.alarm),
                                        Text(cubit.allPatientRequest!.data!.data![index].visitTime!)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
        ),
      );
    }, listener: (context,state){
    });
  }

}
