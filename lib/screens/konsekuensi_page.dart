import 'package:flutter/material.dart';

import '../configs/constant.dart';

class KonsekuensiPage extends StatefulWidget {
  const KonsekuensiPage({super.key});

  @override
  State<KonsekuensiPage> createState() => _KonsekuensiPageState();
}

class _KonsekuensiPageState extends State<KonsekuensiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              const Text("Konsekuensi", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Constant.colorSecondary),
      body: SingleChildScrollView(
        child: Column(
          children: [
            el("20", "Bimbingan Wali Kelas"),
            el("30",
                "Penggilan Orang Tua ke 1, Tanda Tangan Surat Skorsing 1 hari dan Membersihkan Kelas"),
            el("40",
                "Penanganan Wali Kelas dan Guru BK diberikan hukuman Membersihkan Kelas"),
            el("50",
                "Panggilan Orang Tua ke 2, Tanda Tangan Surat Skorsing 3 hari dan Membersihkan Lingkungan Sekolah"),
            el("80",
                "Panggilan Orang Tua ke 3 dan Tanda Tangan Surat Skorsing 1 minggu"),
            el("100", "Dikembalikan ke Orang Tua"),
          ],
        ),
      ),
    );
  }

  Padding el(String poin, String konsekuensi) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 2,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(10.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                konsekuensi,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "$poin Point",
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
