import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../configs/api.dart';
import '../../models/login_model.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<bool> login(
      String txtUsername, String txtPassword, String? role) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    try {
      final data = FormData.fromMap({
        "username": txtUsername,
        "password": txtPassword,
      });

      String urlLogin = Api.loginSiswa;
      if (role == 'ortu') urlLogin = Api.loginOrtu;

      final response = await _dio.post(urlLogin, data: data);

      if (response.statusCode == 200) {
        LoginModel loginModel = LoginModel.fromJson(response.data);

        preferences.setString("id_akun", loginModel.idAkun);
        preferences.setString("nama_akun", loginModel.namaAkun);
        preferences.setString("username", loginModel.username);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
