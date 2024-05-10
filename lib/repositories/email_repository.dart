import 'package:dio/dio.dart';
import 'package:practice_bl_part3/consts/app_consts.dart';

class EmailRepository {
  EmailRepository({required this.dio});
  final Dio dio;

  Future<void> sendEmail(
      {required String name,
      required String email,
      required String message}) async {
    await dio.post(
      "https://api.emailjs.com/api/v1.0/email/send",
      data: {
        "service_id": AppConsts.serviceId,
        "template_id": AppConsts.templateId,
        "user_id": AppConsts.userId,
        "accessToken": AppConsts.accessToken,
        "template_params": {
          "to_name": name,
          "email": email,
          "message": message,
        }
      },
    );
  }
}
