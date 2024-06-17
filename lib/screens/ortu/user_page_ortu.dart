import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import '../../configs/constant.dart';
import '../../providers/loading_provider.dart';
import '../../services/user_service.dart';
import '../login_page.dart';

class UserPageOrtu extends StatefulWidget {
  const UserPageOrtu({super.key});

  @override
  State<UserPageOrtu> createState() => _UserPageOrtuState();
}

class _UserPageOrtuState extends State<UserPageOrtu> {
  final UserService _userService = UserService();

  final TextEditingController txtId = TextEditingController();
  final TextEditingController txtNama = TextEditingController();
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      txtId.text = prefs.getString('id_akun') ?? '';
      txtNama.text = prefs.getString('nama_akun') ?? '';
      txtUsername.text = prefs.getString('username') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constant.colorPrimary,
        appBar: AppBar(
            title: const Text("Profil", style: TextStyle(color: Colors.white)),
            centerTitle: true,
            backgroundColor: Constant.colorSecondary),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("${Constant.assetUrl}logo.png")
                        as ImageProvider,
                  ),
                ),
                Offstage(
                  offstage: true,
                  child: TextFormField(
                    controller: txtId,
                  ),
                ),
                const SizedBox(height: 24.0),
                const Text('Nama Lengkap',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 8.0),
                TextFormField(
                  enabled: false,
                  controller: txtNama,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Cth: Yunita',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 12.0),
                const Text('Username',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 8.0),
                TextFormField(
                  enabled: false,
                  controller: txtUsername,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Cth: yunita',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 12.0),
                const Text('Password',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 8.0),
                TextFormField(
                  enabled: true,
                  controller: txtPassword,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 18.0),
                Consumer<LoadingProvider>(builder: (_, loadingProvider, __) {
                  return ElevatedButton(
                      onPressed: () async {
                        loadingProvider.setLoading(true);
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        String? id = prefs.getString('id_akun') ?? "";
                        String password = txtPassword.text.toString();

                        _userService
                            .editProfil(id, password, "ortu")
                            .then((value) {
                          final snackBar = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'Berhasil!',
                              message: 'Password berhasil diubah',
                              contentType: ContentType.success,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        }).catchError((err) {
                          loadingProvider.setLoading(false);
                          final snackBar = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'Error!',
                              message: (err.response != null)
                                  ? err.response?.data
                                  : "Terjadi kesalahan, periksa koneksi internetmu",
                              contentType: ContentType.failure,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        foregroundColor: Colors.white,
                        backgroundColor: Constant.colorSecondary,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15.0), // Border radius 15
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Edit Password',
                          textAlign: TextAlign.center, // Teks diatur ke tengah
                        ),
                      ));
                }),
                const SizedBox(height: 18.0),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red[400],
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // Border radius 15
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Logout',
                        textAlign: TextAlign.center, // Teks diatur ke tengah
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
