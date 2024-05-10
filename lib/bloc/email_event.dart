part of 'email_bloc.dart';

@immutable
sealed class EmailEvent {}

class SendEmailEvent extends EmailEvent {
  final String email;
  final String message;
  final String name;
  SendEmailEvent({required this.email, required this.message, required this.name});
}
