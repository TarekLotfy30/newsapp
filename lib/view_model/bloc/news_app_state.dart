part of 'news_app_cubit.dart';

abstract class NewsAppState {}

class NewsAppInitial extends NewsAppState {}

class ChangeIndex extends NewsAppState {}

//business
class LoadingBusinessNews extends NewsAppState {}

class GetBusinessNewsSuccess extends NewsAppState {}

class GetBusinessNewsError extends NewsAppState {
  //fe el error hab3tlo el data
  final String error;

  GetBusinessNewsError(this.error);
}

//sports
class LoadingSportsNews extends NewsAppState {}

class GetSportsNewsSuccess extends NewsAppState {}

class GetSportsNewsError extends NewsAppState {
  //fe el error hab3tlo el data
  final String error;

  GetSportsNewsError(this.error);
}

//science
class LoadingScienceNews extends NewsAppState {}

class GetScienceNewsSuccess extends NewsAppState {}

class GetScienceNewsError extends NewsAppState {
  //fe el error hab3tlo el data
  final String error;

  GetScienceNewsError(this.error);
}

//change theme
class ChangeThemeColorState extends NewsAppState {}

//change widget
class ChangeWidgetStyleState extends NewsAppState {}

//search
class LoadingSearchState extends NewsAppState {}

class GetSearchNewsSuccess extends NewsAppState {}

class GetSearchNewsError extends NewsAppState {
  //fe el error hab3tlo el data
  final String error;

  GetSearchNewsError(this.error);
}
