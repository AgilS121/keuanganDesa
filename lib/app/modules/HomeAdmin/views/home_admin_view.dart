import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_admin_controller.dart';
import '../../../components/custom_appbar.dart';
import '../../../../colors.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeAdminView extends GetView<HomeAdminController> {
  const HomeAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeAdminController controller = Get.put(HomeAdminController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: CustomAppBar(title: 'Home Admin'),
      ),
      backgroundColor: AppColors.secondary,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Bungkus Stack dalam SizedBox agar bisa dihitung tingginya
            SizedBox(
              height: 550, // Atur tinggi agar Stack bisa menyesuaikan
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // 🔹 Header Biru
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 15, bottom: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selamat ${controller.getKeteranganWaktu()}, Admin!",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildStatCards(context),
                      ],
                    ),
                  ),

                  // 🔹 Statistik
                  Positioned(
                    top: 130,
                    left: 0,
                    right: 0,
                    child: IgnorePointer(
                      ignoring: false,
                      child: Container(
                        // height: context.height,
                        margin: const EdgeInsets.only(
                            bottom: 30), // Tambahkan margin bawah
                        // margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          // boxshadow only top
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: Offset(
                                  0, -4), // -dy agar shadow hanya di atas
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: AppColors.third,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "Statistik",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            _buildChart(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 🔹 Tambahkan SizedBox agar bisa di-scroll sepenuhnya
            const SizedBox(height: 30),

            // 🔹 Tambahan Isi
            Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 15, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Pemasukan Terakhir",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  Container(
                    child: _buildPemasukan(),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 0, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Pengeluaran Terakhir",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  Container(
                    child: _buildPengeluaran(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // 🔹 Widget: Statistik Cards
  Widget _buildStatCards(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _statCard("Saldo", "24.000", Icons.money, AppColors.primary),
        _statCard("Pengeluaran", "1.000", Icons.money_off, AppColors.primary),
        _statCard("Pemasukan", "1.000", Icons.attach_money, AppColors.primary),
      ],
    );
  }

  /// 🔹 Widget Statistik Chart
  Widget _buildChart() {
    final HomeAdminController controller = Get.put(HomeAdminController());

    return Column(
      children: [
        SizedBox(
          height: 300,
          child: Obx(
            () => LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(value.toInt().toString(),
                              style: TextStyle(fontSize: 12)),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  border: Border.all(color: Colors.grey.shade400, width: 1),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: controller.pemasukanData,
                    isCurved: false,
                    color: AppColors.primary,
                    barWidth: 4,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(
                        show: true,
                        color: AppColors.secondary.withOpacity(0.7)),
                  ),
                  LineChartBarData(
                    spots: controller.pengeluaranData,
                    isCurved: false,
                    color: AppColors.danger,
                    barWidth: 4,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(
                        show: true,
                        color: AppColors.secondary.withOpacity(0.3)),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),

        // Keterangan warna garis
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLegend(AppColors.primary, "Pemasukan"),
            const SizedBox(width: 16),
            _buildLegend(AppColors.danger, "Pengeluaran"),
          ],
        ),

        const SizedBox(height: 10),

        // Tombol Update Data Chart
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary, // Warna tombol
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Radius sudut
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          onPressed: () => controller.updateChartData(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.refresh,
                  color: Colors.white), // Tambahkan icon refresh
              const SizedBox(width: 8), // Spasi antara icon dan teks
              const Text("Update Data", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLegend(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  // 🔹 Widget Statistik Card
  Widget _statCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: AppColors.third.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, size: 20, color: color),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.text,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPemasukan() {
    final HomeAdminController controller = Get.put(HomeAdminController());
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
                  subtitle: Text(
                      "Tanggal: ${data['tanggal']}\n${data['keterangan']}"),
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
    final HomeAdminController controller = Get.put(HomeAdminController());
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
                  subtitle: Text(
                      "Tanggal: ${data['tanggal']}\n${data['keterangan']}"),
                  trailing: Text(
                    "Rp ${data['jumlah']}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ),
              );
            }).toList(),
          )),
    );
  }
}
