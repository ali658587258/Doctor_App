import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:session2_1/models/show_patient_model.dart';

import '../../models/all_patient_request.dart';
import '../../service/dio_helper/dio_helper.dart';
import '../../service/sp_helper/sp_helper.dart';
import '../../service/sp_helper/sp_keys.dart';

part 'show_patient_state.dart';

class ShowPatientCubit extends Cubit<ShowPatientState> {
  ShowPatientCubit() : super(ShowPatientInitial());
  static ShowPatientCubit get(context) => BlocProvider.of(context);

ShowPatientModel? showPatientModel;

  showPatient({
    required int id
  }){
    emit(ShowPatientLoading());
    DioHelper.getData(
        url: 'doctorpatients/$id',
        token: SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token)
    ).then((value){
      showPatientModel= ShowPatientModel.fromJson(value.data);

      emit(ShowPatientSuccess());
      print(showPatientModel!.data!);
    }).catchError((error){
      print('Error $error');
      emit(ShowPatientError());
    });
  }

}
