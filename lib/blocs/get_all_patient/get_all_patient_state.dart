part of 'get_all_patient_cubit.dart';

@immutable
abstract class GetAllPatientState {}

class GetAllPatientInitial extends GetAllPatientState {}


class GetAllPatientSuccess extends GetAllPatientState {}
class GetAllPatientError extends GetAllPatientState {}
class GetAllPatientLoading extends GetAllPatientState {}