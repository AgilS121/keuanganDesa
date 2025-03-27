import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keuangandesa/app/modules/riwayatkeuangan/controllers/riwayatkeuangan_controller.dart';
import 'package:keuangandesa/colors.dart';

class RiwayatkeuanganView extends StatefulWidget {
  const RiwayatkeuanganView({super.key});

  @override
  _RiwayatkeuanganViewState createState() => _RiwayatkeuanganViewState();
}

class _RiwayatkeuanganViewState extends State<RiwayatkeuanganView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
              height: 20), // Memberi jarak dari atas (untuk status bar)
          TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab, // Indikator full width
            indicator: BoxDecoration(
              color: AppColors.primary,
            ),
            tabs: const [
              Tab(text: "Pemasukan"),
              Tab(text: "Pengeluaran"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                PemasukanView(),
                PengeluaranView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

Widget _buildPemasukan() {
  final RiwayatkeuanganController controller =
      Get.put(RiwayatkeuanganController());
  return Container(
    child: Obx(() => ListView(
          shrinkWrap: true,
          children: controller.pemasukan.map((data) {
            return Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 8),
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                title: Text(data['sumber'],
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle:
                    Text("Tanggal: ${data['tanggal']}\n${data['keterangan']}"),
                trailing: Text(
                  "Rp ${data['jumlah']}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ),
            );
          }).toList(),
        )),
  );
}

Widget _buildPengeluaran() {
  final RiwayatkeuanganController controller =
      Get.put(RiwayatkeuanganController());
  return Container(
    child: Obx(() => ListView(
          shrinkWrap: true,
          children: controller.pengeluaran.map((data) {
            return Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 8),
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                title: Text(data['sumber'],
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle:
                    Text("Tanggal: ${data['tanggal']}\n${data['keterangan']}"),
                trailing: Text(
                  "Rp ${data['jumlah']}",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ),
            );
          }).toList(),
        )),
  );
}

class PemasukanView extends StatelessWidget {
  const PemasukanView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:
            Container(padding: EdgeInsets.all(10), child: _buildPemasukan()));
  }
}

class PengeluaranView extends StatelessWidget {
  const PengeluaranView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:
            Container(padding: EdgeInsets.all(10), child: _buildPengeluaran()));
  }
}
