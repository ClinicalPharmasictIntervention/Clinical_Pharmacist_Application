import 'package:clinical_pharmacist_intervention/data/models/doctor_model.dart';
import 'package:clinical_pharmacist_intervention/shared/shared_variables.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 32),
        receiveTimeout: const Duration(seconds: 32),
        sendTimeout: const Duration(seconds: 32),
      ),
    );
  }

  Future<dynamic> getPhysicians({ String? path, Map<String, dynamic>? queryParameter,}) async {
    try {
      Response response = await dio!.get("${baseUrl}v1/physician/");

      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
