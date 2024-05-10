import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_bl_part3/bloc/email_bloc.dart';
import 'package:practice_bl_part3/repositories/dio_settings.dart';
import 'package:practice_bl_part3/repositories/email_repository.dart';
import 'package:practice_bl_part3/ui/my_home_page.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => EmailRepository(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
      ],
      child: BlocProvider(
        create: (context) => EmailBloc(
            repository: RepositoryProvider.of<EmailRepository>(context)),
        child: const MaterialApp(
          home: MyAppWidget(),
        ),
      ),
    ),
  );
}
