import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../configs/api.dart';

class UserService {
  final Dio _dio = Dio();

  Future<Either<String, bool>> editProfil(
      String id, String password, String tipe) async {
    final data =
        FormData.fromMap({"id": id, "password": password, "tipe": tipe});

    try {
      _dio.options.headers['Content-Type'] = 'multipart/form-data';
      final response = await _dio.post(
        Api.editProfil,
        data: data,
      );

      if (response.statusCode == 200) {
        return const Right(true);
      }

      return const Left('Terjadi kesalahan');
    } on DioException catch (_) {
      return const Left('Terjadi kesalahan pada server');
    }
  }
}
