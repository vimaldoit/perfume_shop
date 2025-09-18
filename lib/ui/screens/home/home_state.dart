part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final HomePageModel homedata;

  HomeSuccess({required this.homedata});
}

class HomeFailure extends HomeState {
  final String error;

  HomeFailure({required this.error});
}
