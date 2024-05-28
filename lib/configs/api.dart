class Api {
  static const String baseUrl1 = "192.168.254.8";
  static const String baseUrl = "http://192.168.254.8/point-sekolah/api/";

  static const String downloadSurat =
      "point-sekolah/surat_pemanggilan/download/";
  static const String loginSiswa = "${baseUrl}login_siswa";
  static const String loginOrtu = "${baseUrl}login_ortu";
  static const String jumlahPoint = "${baseUrl}jumlah_point?id=";
  static const String peraturan = "${baseUrl}peraturan";
  static const String riwayatPelanggaran = "${baseUrl}riwayat_pelanggaran?id=";
  static const String riwayatPemanggilan = "${baseUrl}riwayat_pemanggilan?id=";

  static const String hewan = "${baseUrl}hewan";
  static const String ajukanAdopsi = "${baseUrl}ajukan_adopsi";
  static const String ubahProfil = "${baseUrl}ubah_profil";
}
