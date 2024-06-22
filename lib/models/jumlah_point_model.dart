import 'dart:convert';

JumlahPointModel jumlahPointModelFromJson(String str) =>
    JumlahPointModel.fromJson(json.decode(str));

String jumlahPointModelToJson(JumlahPointModel data) =>
    json.encode(data.toJson());

class JumlahPointModel {
  String jumlahPoint;
  String idSurat;
  String konsekuensi;

  JumlahPointModel({
    required this.jumlahPoint,
    required this.idSurat,
    required this.konsekuensi,
  });

  factory JumlahPointModel.fromJson(Map<String, dynamic> json) =>
      JumlahPointModel(
        jumlahPoint: json["jumlah_point"],
        idSurat: json["id_surat"],
        konsekuensi: json["konsekuensi"],
      );

  Map<String, dynamic> toJson() => {
        "jumlah_point": jumlahPoint,
        "id_surat": idSurat,
        "konsekuensi": konsekuensi,
      };
}
