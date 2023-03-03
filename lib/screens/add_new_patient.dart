
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


import '../blocs/add_patient/add_patient_cubit.dart';
import '../componentes/input_field.dart';
import '../componentes/my_button.dart';
import '../componentes/my_text_field.dart';
import '../src/app_colors.dart';
import '../utils/app_navigator.dart';
import 'home_screen.dart';


class AddNewPatient extends StatefulWidget {

  @override
  State<AddNewPatient> createState() => _AddNewPatientState();
}

class _AddNewPatientState extends State<AddNewPatient> {

  DateTime dateOfBirth = DateTime.now();
  DateTime visitTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPatientCubit,AddPatientState>(listener: (context, state) {
        if(state is AddPatientSuccess )
        {
          AppNavigator.navigateToNewScreen(context, HomeScreen(), true);
        }
      },
      builder:  (context,state){
        var cubit= AddPatientCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.kMainColors,
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 40
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,
                        vertical: 30
                    ),
                    child: Text('Patient registration'.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.white
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                      child: Column(
                        children: [
                          Text('Add your Patient easily now !',
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyTextField(label: 'Name',
                              controller: cubit.nameController,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyTextField(label: 'Diagnosis',
                              controller: cubit.diagnosisController,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyTextField(label: 'Address',
                              controller: cubit.addressController,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 140,
                                  child: InputField(
                                    text: 'Date Birth',
                                    hint: cubit.dateOfBirthController.text,
                                    widget: IconButton(
                                        icon: const Icon(
                                          Icons.calendar_today_outlined,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () async {
                                          DateTime? pickerDate = await showDatePicker(
                                            context: context,
                                            initialDate: dateOfBirth,
                                            firstDate: DateTime(1920),
                                            lastDate: DateTime(2121),
                                          );

                                          if (pickerDate != null && pickerDate != dateOfBirth) {
                                            setState(() {
                                              dateOfBirth = pickerDate;
                                              String Onlydate = new DateFormat("yyyy-MM-dd").format(pickerDate);
                                              cubit.dateOfBirthController.text = '$Onlydate';
                                            });
                                          } else {
                                            print("it's null or something is wrong");
                                          }
                                        }
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 140,
                                  child: InputField(
                                    text: 'Visit Time',
                                    hint: cubit.visitTimeController.text,
                                    widget: IconButton(
                                        icon: const Icon(
                                          Icons.calendar_today_outlined,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () async {
                                          DateTime? pickerDate = await showDatePicker(
                                            context: context,
                                            initialDate: visitTime,
                                            firstDate: DateTime(2015),
                                            lastDate: DateTime(2121),
                                          );

                                          if (pickerDate != null && pickerDate != visitTime) {
                                            setState(() {
                                              visitTime = pickerDate;
                                              String Onlydate = new DateFormat("yyyy-MM-dd").format(pickerDate);
                                              cubit.visitTimeController.text = '$Onlydate';
                                            });
                                          } else {
                                            print("it's null or something is wrong");
                                          }
                                        }
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          if(state is AddPatientSuccess )

                            LinearProgressIndicator(),
                          MyButton(text: 'Add Patient', function: (){
                            cubit.addPatient();
                          })


                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
