import 'dart:convert';

RiwayatPelanggaranModel riwayatPelanggaranModelFromJson(String str) =>
    RiwayatPelanggaranModel.fromJson(json.decode(str));

String riwayatPelanggaranModelToJson(RiwayatPelanggaranModel data) =>
    json.encode(data.toJson());

class RiwayatPelanggaranModel {
  String idPelanggaranSiswa;
  String idPelanggaran;
  String idSiswa;
  String kelas;
  String idPelapor;
  DateTime tanggalPelanggaran;
  String point;
  String namaPelanggaran;
  String pointPelanggaran;
  String idJenisPelanggaran;

  RiwayatPelanggaranModel({
    required this.idPelanggaranSiswa,
    required this.idPelanggaran,
    required this.idSiswa,
    required this.kelas,
    required this.idPelapor,
    required this.tanggalPelanggaran,
    required this.point,
    required this.namaPelanggaran,
    required this.pointPelanggaran,
    required this.idJenisPelanggaran,
  });

  factory RiwayatPelanggaranModel.fromJson(Map<String, dynamic> json) =>
      RiwayatPelanggaranModel(
        idPelanggaranSiswa: json["id_pelanggaran_siswa"],
        idPelanggaran: json["id_pelanggaran"],
        idSiswa: json["id_siswa"],
        kelas: json["kelas"],
        idPelapor: json["id_pelapor"],
        tanggalPelanggaran: DateTime.parse(json["tanggal_pelanggaran"]),
        point: json["point"],
        namaPelanggaran: json["nama_pelanggaran"],
        pointPelanggaran: json["point_pelanggaran"],
        idJenisPelanggaran: json["id_jenis_pelanggaran"],
      );

  Map<String, dynamic> toJson() => {
        "id_pelanggaran_siswa": idPelanggaranSiswa,
        "id_pelanggaran": idPelanggaran,
        "id_siswa": idSiswa,
        "kelas": kelas,
        "id_pelapor": idPelapor,
        "tanggal_pelanggaran": tanggalPelanggaran.toIso8601String(),
        "point": point,
        "nama_pelanggaran": namaPelanggaran,
        "point_pelanggaran": pointPelanggaran,
        "id_jenis_pelanggaran": idJenisPelanggaran,
      };
}
