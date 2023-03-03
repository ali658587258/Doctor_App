import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/all_patient_request.dart';
import '../../service/dio_helper/dio_helper.dart';
import '../../service/sp_helper/sp_helper.dart';
import '../../service/sp_helper/sp_keys.dart';

part 'get_all_patient_state.dart';

class GetAllPatientCubit extends Cubit<GetAllPatientState> {
  GetAllPatientCubit() : super(GetAllPatientInitial());
  static GetAllPatientCubit get(context) => BlocProvider.of(context);


  AllPatientRequest ?allPatientRequest;

  getAllPatient() {
    emit(GetAllPatientLoading());
    DioHelper.getData(
        url: 'doctorpatients',
        token: SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token)
    ).then((value) {
      emit(GetAllPatientSuccess());
      allPatientRequest= AllPatientRequest.fromJson(value.data);

    }).catchError((error){
      emit(GetAllPatientError());
      print(error);
    });
  }


}
