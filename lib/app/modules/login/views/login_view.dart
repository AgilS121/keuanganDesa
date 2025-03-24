import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import 'package:keuangandesa/colors.dart';

import 'package:flutter/services.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
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
      backgroundColor: AppColors.secondary, // Set background #F2F2F2
      body: Center(
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
                'Masuk ke Aplikasi'),
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
            SizedBox(height: 15),
            Text(
              'Atau',
              style: TextStyle(color: Colors.grey, fontSize: 16),
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
                // tipe password
                obscureText: true,
                controller: controller.passwordController,
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
                  onPressed: controller.login,
                  child: Text(
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.bold,
                      ),
                      'Login')),
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
                          'Lupa Password?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: 'Archivo',
                          ),
                        )),
                    TextButton(
                        onPressed: () => Get.offNamed('/register'),
                        child: Text(
                          'Daftar',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: 'Archivo',
                          ),
                        ))
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
