import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../configs/api.dart';
import '../models/riwayat_pelanggaran_model.dart';

class RiwayatPelanggaranService {
  final Dio _dio = Dio();

  Future<List<RiwayatPelanggaranModel>> getRiwayatPelanggaran() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString("id_akun") ?? '';

    final response = await _dio.get(Api.riwayatPelanggaran + id);

    List<RiwayatPelanggaranModel> data = <RiwayatPelanggaranModel>[];
    response.data.forEach((val) {
      data.add(RiwayatPelanggaranModel.fromJson(val));
    });

    return data;
  }
}
