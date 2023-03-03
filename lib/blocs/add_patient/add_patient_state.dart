part of 'add_patient_cubit.dart';

@immutable
abstract class AddPatientState {}

class AddPatientInitial extends AddPatientState {}


class AddPatientSuccess  extends AddPatientState {}
class AddPatientError extends AddPatientState {}
class AddPatientLoading  extends AddPatientState {}