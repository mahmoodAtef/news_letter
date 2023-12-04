part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class GetNewsLoading extends NewsState {}
class GetNewsSuccess extends NewsState {}
class GetNewsError extends NewsState {}

