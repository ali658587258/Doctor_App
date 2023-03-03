import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:session2_1/service/dio_helper/dio_helper.dart';

import '../../service/sp_helper/sp_helper.dart';
import '../../service/sp_helper/sp_keys.dart';

part 'delete_patient_state.dart';

class DeletePatientCubit extends Cubit<DeletePatientState> {
  DeletePatientCubit() : super(DeletePatientInitial());

  static DeletePatientCubit get(context) => BlocProvider.of(context);


  deletePatient({required int id}){
    emit(DeletePatientLoading());
    DioHelper.deleteData(
      url: 'doctorpatients/$id',
        token:
        SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token)
    ).then((value){
      emit(DeletePatientSuccess());
    }).catchError((error){
      emit(DeletePatientError());
    });
  }
}
