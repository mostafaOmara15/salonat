part of 'staff_cubit.dart';

@immutable
abstract class StaffState {}

class StaffInitial extends StaffState {}
class StaffLoading extends StaffState {}
class StaffSuccess extends StaffState {}
class StaffError extends StaffState {}

