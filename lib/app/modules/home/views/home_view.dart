import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    String userId = "123"; // Contoh user ID, nanti bisa diambil dari sesi login

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          title: const Text('Home'),
          centerTitle: true,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),

          // Tampilkan daftar tagihan
          Expanded(
            child: Obx(() {
              if (controller.tagihanList.isEmpty) {
                return const Center(child: Text("Tidak ada tagihan."));
              }

              return ListView.builder(
                itemCount: controller.tagihanList.length,
                itemBuilder: (context, index) {
                  final tagihan = controller.tagihanList[index];

                  return Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: ListTile(
                      title: Text(tagihan["nama"]),
                      subtitle: Text("Rp ${tagihan["jumlah"]}"),
                      trailing: Text(
                        tagihan["status"],
                        style: TextStyle(
                          color: tagihan["status"] == "Lunas"
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),

          // Cek apakah user punya jadwal ronda
          Obx(() {
            if (controller.isUserScheduled(userId)) {
              return Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Jadwal Ronda Anda",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    ...controller.jadwalRondaList
                        .where((ronda) => ronda["id_user"] == userId)
                        .map((ronda) => Text(
                              "Tanggal: ${ronda["tanggal"]}",
                              style: const TextStyle(color: Colors.white),
                            ))
                        .toList(),
                  ],
                ),
              );
            }
            return const SizedBox(); // Jika tidak ada jadwal ronda, kosongkan
          }),
        ],
      ),
    );
  }
}
