part of 'show_patient_cubit.dart';

@immutable
abstract class ShowPatientState {}

class ShowPatientInitial extends ShowPatientState {}

class ShowPatientSuccess extends ShowPatientState{}
class ShowPatientLoading extends ShowPatientState{}
class ShowPatientError extends ShowPatientState{}