import 'package:flutter/material.dart';

import '../models/riwayat_pemanggilan_model.dart';
import '../services/riwayat_pemanggilan_service.dart';

class RiwayatPengambilanPage extends StatefulWidget {
  const RiwayatPengambilanPage({super.key});

  @override
  State<RiwayatPengambilanPage> createState() => _RiwayatPengambilanPageState();
}

class _RiwayatPengambilanPageState extends State<RiwayatPengambilanPage> {
  final RiwayatPemanggilanService riwayatPemanggilanService =
      RiwayatPemanggilanService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pemanggilan'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<RiwayatPemanggilanModel>>(
        future: riwayatPemanggilanService.getRiwayatPemanggilan(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data'));
          } else {
            List<RiwayatPemanggilanModel> items = snapshot.data!;
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
                            items[index].namaGuru,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "${items[index].tanggalPemanggilan.year.toString().padLeft(4, '0')}-${items[index].tanggalPemanggilan.month.toString().padLeft(2, '0')}-${items[index].tanggalPemanggilan.day.toString().padLeft(2, '0')} - ${items[index].jamPemanggilan}",
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
