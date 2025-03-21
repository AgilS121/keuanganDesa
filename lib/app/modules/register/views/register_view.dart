import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';
import 'package:keuangandesa/colors.dart';

import 'package:flutter/services.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.primary, // Warna status bar
          statusBarIconBrightness: Brightness.light, // Ikon putih
        ),
      ),
      backgroundColor: Color(0xFFF2F2F2), // Set background #F2F2F2
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/loginImage.png',
              width: 200, // Atur lebar gambar
              height: 100, // Atur tinggi gambar
              fit: BoxFit.cover, // Sesuaikan ukuran gambar
            ),
            SizedBox(
              height: 15,
            ),
            Text(
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.bold),
                'Daftar Akun Baru'),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 320,
              decoration: BoxDecoration(),
              child: TextField(
                controller: controller.namalengkapController,
                decoration: InputDecoration(
                  filled: true, // Aktifkan background warna
                  fillColor: Colors.white, // Background putih
                  border: OutlineInputBorder(
                    // agar tidak memiliki outline / border
                    borderSide: BorderSide.none,
                    // borderSide: BorderSide(),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  labelText: 'Nama Lengkap',
                  prefixIcon: Icon(Icons.person, color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 14), // Kurangi padding dalam
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 320,
              decoration: BoxDecoration(),
              child: TextField(
                controller: controller.nohpController,
                decoration: InputDecoration(
                  filled: true, // Aktifkan background warna
                  fillColor: Colors.white, // Background putih
                  border: OutlineInputBorder(
                    // agar tidak memiliki outline / border
                    borderSide: BorderSide.none,
                    // borderSide: BorderSide(),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  labelText: 'Nomor HP',
                  prefixIcon: Icon(Icons.phone, color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 14), // Kurangi padding dalam
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),
            Container(
              width: 320,
              decoration: BoxDecoration(),
              child: TextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  filled: true, // Aktifkan background warna
                  fillColor: Colors.white, // Background putih
                  border: OutlineInputBorder(
                    // agar tidak memiliki outline / border
                    borderSide: BorderSide.none,
                    // borderSide: BorderSide(),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email, color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 14), // Kurangi padding dalam
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 320,
              // Kurangi padding dalam TextField
              decoration: BoxDecoration(),
              child: TextField(
                controller: controller.passwordController,
                // tipe password
                obscureText: true,

                decoration: InputDecoration(
                  filled: true, // Aktifkan background warna
                  fillColor: Colors.white, // Background putih
                  border: OutlineInputBorder(
                    // agar tidak memiliki outline / border
                    borderSide: BorderSide.none,
                    // borderSide: BorderSide(),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  labelText: 'Password',

                  prefixIcon: Icon(Icons.password, color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 14), // Kurangi padding dalam
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 320,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF32BC9B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  onPressed: controller.register,
                  child: Text(
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.bold,
                      ),
                      'Daftar')),
            ),
            SizedBox(
              height: 10,
            ),
            // dibuat flex ke sampingg textButton lupa password dan daftar gimana
            Container(
              width: 320,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () => Get.toNamed('/lupaPassword'),
                        child: Text(
                          'Sudah punya akun? Login',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: 'Archivo',
                          ),
                        )),
                  ]),
            )
          ],
        ),
      )),
    );
  }
}
