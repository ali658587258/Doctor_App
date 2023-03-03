import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/add_patient_request.dart';
import '../../service/dio_helper/dio_helper.dart';
import '../../service/sp_helper/sp_helper.dart';
import '../../service/sp_helper/sp_keys.dart';

part 'add_patient_state.dart';

class AddPatientCubit extends Cubit<AddPatientState> {
  AddPatientCubit() : super(AddPatientInitial());
  static AddPatientCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController diagnosisController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController visitTimeController = TextEditingController();

  AddPatientRequst ?addPatientRequst;


  addPatient()
  {
    emit(AddPatientLoading());
    DioHelper.postData(url: 'doctorpatients',
        token: SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token),
        data:
        {
          "name":nameController.text,
          "date_of_birth":dateOfBirthController.text,
          "diagnosis":diagnosisController.text,
          "address":addressController.text,
          "visit_time":visitTimeController.text

        }
    ).then((value) {
      print(value.data);

      emit(AddPatientSuccess());

    }).catchError((error){
      emit(AddPatientError());
      print(error);
    });
  }
}
