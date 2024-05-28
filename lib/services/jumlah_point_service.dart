import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../configs/api.dart';
import '../models/jumlah_point_model.dart';

class JumlahPointService {
  final Dio _dio = Dio();

  Future<JumlahPointModel> getJumlahPoint() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString("id_akun") ?? '';

    final response = await _dio.get(Api.jumlahPoint + id);

    JumlahPointModel data = JumlahPointModel.fromJson(response.data);

    return data;
  }
}
