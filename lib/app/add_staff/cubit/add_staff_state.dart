part of 'add_staff_cubit.dart';

@immutable
abstract class AddStaffState {}
class AddStaffInitial extends AddStaffState {}
class ImageUploadLoading extends AddStaffState {}
class ImageUploaded extends AddStaffState {}

class LoadingSubServices extends AddStaffState {}
class SuccessSubServices extends AddStaffState {}
class ErrorSubServices extends AddStaffState {}
class SelectSubService extends AddStaffState {}
