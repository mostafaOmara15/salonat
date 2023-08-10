part of 'booking_details_cubit.dart';

@immutable
abstract class BookingDetailsState {}

class BookingDetailsInitial extends BookingDetailsState {}
class BookingDetailsLoading extends BookingDetailsState {}
class BookingDetailsSuccess extends BookingDetailsState {}
