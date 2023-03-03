part of 'doctor_cubit.dart';

@immutable
abstract class DoctorState {}

class DoctorInitial extends DoctorState {}

class DoctorRegisterError extends DoctorState {}
class DoctorRegisterSuccess extends DoctorState {}
class DoctorRegisterLoading extends DoctorState {}



class DoctorLoginError extends DoctorState {}
class DoctorLoginSuccess extends DoctorState {}
class DoctorLoginLoading extends DoctorState {}

class DoctorRefreshError extends DoctorState {}
class DoctorRefreshSuccess extends DoctorState {}
class DoctorRefreshLoading extends DoctorState {}



