import 'package:dio/dio.dart';

import '../../configs/api.dart';
import '../models/peraturan_model.dart';

class PeraturanService {
  final Dio _dio = Dio();

  Future<List<PeraturanModel>> getPeraturan() async {
    final response = await _dio.get(Api.peraturan);

    List<PeraturanModel> data = <PeraturanModel>[];
    response.data.forEach((val) {
      data.add(PeraturanModel.fromJson(val));
    });

    return data;
  }
}
