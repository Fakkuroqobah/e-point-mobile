import 'package:flutter/material.dart';

import '../models/riwayat_pelanggaran_model.dart';
import '../services/riwayat_pelanggaran_service.dart';

class RiwayatPelanggaranPage extends StatefulWidget {
  const RiwayatPelanggaranPage({super.key});

  @override
  State<RiwayatPelanggaranPage> createState() => _RiwayatPelanggaranPageState();
}

class _RiwayatPelanggaranPageState extends State<RiwayatPelanggaranPage> {
  final RiwayatPelanggaranService riwayatpelanggaranService =
      RiwayatPelanggaranService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pelanggaran'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<RiwayatPelanggaranModel>>(
        future: riwayatpelanggaranService.getRiwayatPelanggaran(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data'));
          } else {
            List<RiwayatPelanggaranModel> items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
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
                            items[index].namaPelanggaran,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "${items[index].pointPelanggaran} Point",
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
              },
            );
          }
        },
      ),
    );
  }
}
