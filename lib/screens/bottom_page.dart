import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'home_page.dart';
import 'peraturan_page.dart';
import 'riwayat_pelanggaran_page.dart';
import 'user_page.dart';
import '../configs/constant.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    PeraturanPage(),
    RiwayatPelanggaranPage(),
    UserPage(),
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
            icon: Icon(Iconsax.alarm),
            label: 'Peraturan',
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
