import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../configs/constant.dart';
import '../riwayat_pelanggaran_page.dart';
import '../riwayat_pemanggilan_page.dart';
import 'user_page_ortu.dart';
import 'home_page_ortu.dart';

class BottomOrtuPage extends StatefulWidget {
  const BottomOrtuPage({super.key});

  @override
  State<BottomOrtuPage> createState() => _BottomOrtuPageState();
}

class _BottomOrtuPageState extends State<BottomOrtuPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePageOrtu(),
    RiwayatPengambilanPage(),
    RiwayatPelanggaranPage(),
    UserPageOrtu(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home_hashtag),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.paperclip),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.menu),
            label: 'Riwayat Pelanggaran',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Constant.colorSecondary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
