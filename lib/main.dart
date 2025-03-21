import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.blue, // Ganti warna status bar
      statusBarIconBrightness: Brightness.light, // Icon status bar jadi putih
    ),
  );

  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
