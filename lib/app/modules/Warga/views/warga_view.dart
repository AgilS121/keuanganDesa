import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/warga_controller.dart';
import '../../../components/custom_appbar.dart';

class WargaView extends GetView<WargaController> {
  const WargaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Warga'),
      body: const Center(
        child: Text(
          'WargaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
