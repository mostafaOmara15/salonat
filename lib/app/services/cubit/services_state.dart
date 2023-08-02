part of 'services_cubit.dart';

@immutable
abstract class ServicesState {}

class ServicesInitial extends ServicesState {}
class ServicesLoaded extends ServicesState {}
class Loading extends ServicesState {}
