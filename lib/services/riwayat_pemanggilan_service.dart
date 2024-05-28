import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../configs/api.dart';
import '../models/riwayat_pemanggilan_model.dart';

class RiwayatPemanggilanService {
  final Dio _dio = Dio();

  Future<List<RiwayatPemanggilanModel>> getRiwayatPemanggilan() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString("id_akun") ?? '';

    final response = await _dio.get(Api.riwayatPemanggilan + id);

    List<RiwayatPemanggilanModel> data = <RiwayatPemanggilanModel>[];
    response.data.forEach((val) {
      data.add(RiwayatPemanggilanModel.fromJson(val));
    });

    return data;
  }
}
