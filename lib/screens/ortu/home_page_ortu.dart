import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../configs/api.dart';
import '../../models/jumlah_point_model.dart';
import '../../configs/constant.dart';
import '../../services/jumlah_point_service.dart';

class HomePageOrtu extends StatefulWidget {
  const HomePageOrtu({super.key});

  @override
  State<HomePageOrtu> createState() => _HomePageOrtuState();
}

class _HomePageOrtuState extends State<HomePageOrtu> {
  final JumlahPointService jumlahPointService = JumlahPointService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("POINT", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Constant.colorSecondary),
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
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
