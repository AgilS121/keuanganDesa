import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pengumuman_controller.dart';

class PengumumanView extends GetView<PengumumanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pengumuman Keuangan RT")),
      body: Obx(() {
        if (controller.pengumumanList.isEmpty) {
          return Center(child: Text("Tidak ada pengumuman."));
        }

        return ListView.builder(
          itemCount: controller.pengumumanList.length,
          itemBuilder: (context, index) {
            final pengumuman = controller.pengumumanList[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                title: Text(pengumuman["title"],
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(
                    "${pengumuman["content"]}\nTanggal: ${pengumuman["date"]}"),
                isThreeLine: true,
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () =>
                      controller.removePengumuman(pengumuman["id"]),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addPengumuman(
            "Pengumuman Baru",
            "Isi pengumuman terbaru...",
            "2024-03-20",
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
