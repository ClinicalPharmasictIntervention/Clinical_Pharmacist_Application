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

  static Future<dynamic> getData(
      {String? path, Map<String, dynamic>? queryParameter, List? storeList}) async {
    try {
      Response response =
          await dio!.get(path!, queryParameters: queryParameter!);
          storeList=response.data;

      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}