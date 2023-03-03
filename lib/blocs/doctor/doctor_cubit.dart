import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/add_patient_request.dart';
import '../../models/all_patient_request.dart';
import '../../models/authentication_model.dart';
import '../../service/dio_helper/dio_helper.dart';
import '../../service/sp_helper/sp_helper.dart';
import '../../service/sp_helper/sp_keys.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());

  static DoctorCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Authentication? authentication;

  register() {
    emit(DoctorRegisterLoading());
    DioHelper.postData(url: 'auth/register', data: {
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "title": titleController.text,
      "address": addressController.text
    }).then((value) {
      emit(DoctorRegisterSuccess());

      authentication = Authentication.fromJson(value.data);
      SharedPrefrenceHelper.saveData(
          key: SharedPreferencesKeys.token, value: authentication!.token);
      print(authentication!.token);
    }).catchError((error) {
      emit(DoctorRegisterError());
      print(error);
    });
  }
  login() {
    emit(DoctorLoginLoading());
    DioHelper.postData(url: 'auth/login', data: {
      "email": emailController.text,
      "password": passwordController.text
    }).then((value) {
      emit(DoctorLoginSuccess());
      authentication = Authentication.fromJson(value.data);

      SharedPrefrenceHelper.saveData(
          key: SharedPreferencesKeys.token, value: authentication!.token);

      print(authentication!.token);


      emailController.clear();
      passwordController.clear();
    }).catchError((error) {
      emit(DoctorLoginError());
      print(error);
    });
  }
  refresh(){
    emit(DoctorRefreshLoading());
    DioHelper.postData(
      url: 'auth/refresh',
      data: {},
      token: SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token),
    ).then((value){
      emit(DoctorRefreshSuccess());
    }).catchError((error){
      emit(DoctorRefreshError());
    });
  }


}
