import 'dart:convert';

JumlahPointModel jumlahPointModelFromJson(String str) =>
    JumlahPointModel.fromJson(json.decode(str));

String jumlahPointModelToJson(JumlahPointModel data) =>
    json.encode(data.toJson());

class JumlahPointModel {
  String jumlahPoint;
  String idSurat;

  JumlahPointModel({
    required this.jumlahPoint,
    required this.idSurat,
  });

  factory JumlahPointModel.fromJson(Map<String, dynamic> json) =>
      JumlahPointModel(
        jumlahPoint: json["jumlah_point"],
        idSurat: json["id_surat"],
      );

  Map<String, dynamic> toJson() => {
        "jumlah_point": jumlahPoint,
        "id_surat": idSurat,
      };
}
