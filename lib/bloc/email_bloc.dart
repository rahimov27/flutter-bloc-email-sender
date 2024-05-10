import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:practice_bl_part3/repositories/email_repository.dart';

part 'email_event.dart';
part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  EmailBloc({required this.repository}) : super(EmailInitial()) {
    on<SendEmailEvent>((event, emit) async {
      emit(
        LoadingState(),
      );
      try {
        await repository.sendEmail(
            name: event.name, email: event.email, message: event.message);
        emit(SuccessState());
      } catch (e) {
        if (e is DioException) {
          emit(
            ErrorState(
              errorText: e.response.toString(),
            ),
          );
        } else {
          ErrorState(
            errorText: e.toString(),
          );
        }
      }
    });
  }
  final EmailRepository repository;
}
