part of 'review_cubit.dart';

@immutable
abstract class ReviewState {}

class ReviewInitial extends ReviewState {}
class ReviewLoading extends ReviewState {}
class ReviewSuccess extends ReviewState {}

