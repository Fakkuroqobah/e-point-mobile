import 'dart:convert';

PeraturanModel peraturanModelFromJson(String str) =>
    PeraturanModel.fromJson(json.decode(str));

String peraturanModelToJson(PeraturanModel data) => json.encode(data.toJson());

class PeraturanModel {
  String idPelanggaran;
  String namaPelanggaran;
  String pointPelanggaran;
  String idJenisPelanggaran;
  String namaJenisPelanggaran;

  PeraturanModel({
    required this.idPelanggaran,
    required this.namaPelanggaran,
    required this.pointPelanggaran,
    required this.idJenisPelanggaran,
    required this.namaJenisPelanggaran,
  });

  factory PeraturanModel.fromJson(Map<String, dynamic> json) => PeraturanModel(
        idPelanggaran: json["id_pelanggaran"],
        namaPelanggaran: json["nama_pelanggaran"],
        pointPelanggaran: json["point_pelanggaran"],
        idJenisPelanggaran: json["id_jenis_pelanggaran"],
        namaJenisPelanggaran: json["nama_jenis_pelanggaran"],
      );

  Map<String, dynamic> toJson() => {
        "id_pelanggaran": idPelanggaran,
        "nama_pelanggaran": namaPelanggaran,
        "point_pelanggaran": pointPelanggaran,
        "id_jenis_pelanggaran": idJenisPelanggaran,
        "nama_jenis_pelanggaran": namaJenisPelanggaran,
      };
}
