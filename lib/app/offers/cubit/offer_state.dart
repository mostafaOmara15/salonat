part of 'offer_cubit.dart';

@immutable
abstract class OfferState {}

class OfferInitial extends OfferState {}
class OfferLoading extends OfferState {}
class OfferDataLoaded extends OfferState {}
