part of 'edit_staff_cubit.dart';

@immutable
abstract class EditStaffState {}
class EditStaffInitial extends EditStaffState {}
class ImageUploadLoading extends EditStaffState {}
class ImageUploaded extends EditStaffState {}

class Loading extends EditStaffState {}
class SuccessSubServices extends EditStaffState {}
class ErrorSubServices extends EditStaffState {}
class SelectSubService extends EditStaffState {}
