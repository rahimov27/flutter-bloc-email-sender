part of 'email_bloc.dart';

@immutable
sealed class EmailState {}

final class EmailInitial extends EmailState {}

class LoadingState extends EmailState {}

class SuccessState extends EmailState {}

class ErrorState extends EmailState {
  final String errorText;
  ErrorState({required this.errorText});
}
