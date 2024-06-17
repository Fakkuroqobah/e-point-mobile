import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String idAkun;
  String idSiswa;
  String namaAkun;
  String username;

  LoginModel({
    required this.idAkun,
    required this.idSiswa,
    required this.namaAkun,
    required this.username,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        idAkun: json["id_akun"],
        idSiswa: json["id_siswa"],
        namaAkun: json["nama_akun"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id_akun": idAkun,
        "id_siswa": idSiswa,
        "nama_akun": namaAkun,
        "username": username,
      };
}
