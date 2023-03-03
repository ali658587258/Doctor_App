import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:session2_1/service/dio_helper/dio_helper.dart';

import '../../models/add_patient_request.dart';
import '../../service/sp_helper/sp_helper.dart';
import '../../service/sp_helper/sp_keys.dart';

part 'edit_patient_state.dart';

class EditPatientCubit extends Cubit<EditPatientState> {
  EditPatientCubit() : super(EditPatientInitial());
  static EditPatientCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController diagnosisController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController visitTimeController = TextEditingController();
  AddPatientRequst ?addPatientRequst;



  editPatient({required int id}){
    emit(EditPatientLoading());
    DioHelper.postData(url: 'doctorpatients/$id', data: {
      'name':nameController.text,
      'date_of_birth':dateOfBirthController.text,
      'diagnosis':diagnosisController.text,
      'address':addressController.text,
      'visit_time':visitTimeController.text
    },
      query: {
        '_method': 'put'
      },
      token: SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token),
    ).then((value){
      emit(EditPatientSuccess());
    }).catchError((error){
      emit(EditPatientError());
    });
  }
}
