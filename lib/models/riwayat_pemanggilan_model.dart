import 'dart:convert';

RiwayatPemanggilanModel riwayatPemanggilanModelFromJson(String str) =>
    RiwayatPemanggilanModel.fromJson(json.decode(str));

String riwayatPemanggilanModelToJson(RiwayatPemanggilanModel data) =>
    json.encode(data.toJson());

class RiwayatPemanggilanModel {
  String idSurat;
  String noSurat;
  String idOrtu;
  String idGuru;
  DateTime tanggalPemanggilan;
  String jamPemanggilan;
  DateTime tanggalSurat;
  String namaOrtu;
  String namaSiswa;
  String namaKelas;
  String namaGuru;

  RiwayatPemanggilanModel({
    required this.idSurat,
    required this.noSurat,
    required this.idOrtu,
    required this.idGuru,
    required this.tanggalPemanggilan,
    required this.jamPemanggilan,
    required this.tanggalSurat,
    required this.namaOrtu,
    required this.namaSiswa,
    required this.namaKelas,
    required this.namaGuru,
  });

  factory RiwayatPemanggilanModel.fromJson(Map<String, dynamic> json) =>
      RiwayatPemanggilanModel(
        idSurat: json["id_surat"],
        noSurat: json["no_surat"],
        idOrtu: json["id_ortu"],
        idGuru: json["id_guru"],
        tanggalPemanggilan: DateTime.parse(json["tanggal_pemanggilan"]),
        jamPemanggilan: json["jam_pemanggilan"],
        tanggalSurat: DateTime.parse(json["tanggal_surat"]),
        namaOrtu: json["nama_ortu"],
        namaSiswa: json["nama_siswa"],
        namaKelas: json["nama_kelas"],
        namaGuru: json["nama_guru"],
      );

  Map<String, dynamic> toJson() => {
        "id_surat": idSurat,
        "no_surat": noSurat,
        "id_ortu": idOrtu,
        "id_guru": idGuru,
        "tanggal_pemanggilan":
            "${tanggalPemanggilan.year.toString().padLeft(4, '0')}-${tanggalPemanggilan.month.toString().padLeft(2, '0')}-${tanggalPemanggilan.day.toString().padLeft(2, '0')}",
        "jam_pemanggilan": jamPemanggilan,
        "tanggal_surat": tanggalSurat.toIso8601String(),
        "nama_ortu": namaOrtu,
        "nama_siswa": namaSiswa,
        "nama_kelas": namaKelas,
        "nama_guru": namaGuru,
      };
}
