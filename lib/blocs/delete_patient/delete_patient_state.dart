part of 'delete_patient_cubit.dart';

@immutable
abstract class DeletePatientState {}

class DeletePatientInitial extends DeletePatientState {}

class DeletePatientSuccess  extends DeletePatientState {}
class DeletePatientError extends DeletePatientState {}
class DeletePatientLoading  extends DeletePatientState {}