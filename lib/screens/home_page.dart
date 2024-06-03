import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../configs/api.dart';
import '../models/jumlah_point_model.dart';
import '../configs/constant.dart';
import '../services/jumlah_point_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final JumlahPointService jumlahPointService = JumlahPointService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("POINT"), centerTitle: true),
      backgroundColor: Constant.colorPrimary,
      body: SafeArea(
        child: FutureBuilder<JumlahPointModel>(
            future: jumlahPointService.getJumlahPoint(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('Tidak ada data'));
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(snapshot.data?.jumlahPoint ?? "0",
                          style: TextStyle(
                              fontSize: 62,
                              fontWeight: FontWeight.bold,
                              color: Constant.colorSecondary)),
                      snapshot.data?.idSurat != null
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.redAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        15.0), // Border radius 15
                                  )),
                              onPressed: () async {
                                SharedPreferences preferences =
                                    await SharedPreferences.getInstance();
                                String id =
                                    preferences.getString("id_akun") ?? '';

                                final Uri urlDownloadSuratPemanggilan = Uri(
                                    scheme: 'http',
                                    host: Api.baseUrl1,
                                    path: "${Api.downloadSurat}$id");

                                if (!await launchUrl(
                                  urlDownloadSuratPemanggilan,
                                  mode: LaunchMode.externalApplication,
                                )) {
                                  throw Exception(
                                      'Could not launch $urlDownloadSuratPemanggilan');
                                }
                              },
                              child: const Text("Download surat pemanggilan"))
                          : Container(),
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
