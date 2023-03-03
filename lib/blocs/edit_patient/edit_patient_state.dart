part of 'edit_patient_cubit.dart';

@immutable
abstract class EditPatientState {}

class EditPatientInitial extends EditPatientState {}

class EditPatientSuccess  extends EditPatientState {}
class EditPatientError extends EditPatientState {}
class EditPatientLoading  extends EditPatientState {}