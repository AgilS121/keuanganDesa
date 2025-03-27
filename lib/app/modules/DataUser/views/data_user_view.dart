import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keuangandesa/app/data/models/DataUserModel.dart';
import 'package:keuangandesa/colors.dart';
import '../controllers/data_user_controller.dart';
import 'package:shimmer/shimmer.dart';

class DataUserView extends GetView<DataUserController> {
  const DataUserView({super.key});

  @override
  Widget build(BuildContext context) {
    final DataUserController controller = Get.put(DataUserController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data User'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Input Pencarian
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari pengguna...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) => controller.filterUsers(value),
            ),
          ),

          // ListView Data Pengguna
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                // Tampilkan Skeleton Loading saat data masih dimuat
                return _buildSkeletonList();
              } else {
                // Tampilkan ListView saat data sudah tersedia
                return ListView.builder(
                  itemCount: controller.filteredUsers.length,
                  itemBuilder: (context, index) {
                    final user = controller.filteredUsers[index];

                    return ListTile(
                      leading: CircleAvatar(
                        child: Text("${index + 1}"), // Nomor urut
                      ),
                      title: Text(user.name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit,
                                color: Color.fromARGB(255, 184, 168, 23)),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      onTap: () => Get.to(() => UserDetailView(user: user)),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),

      // Floating Action Button untuk Menambah Data
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddUserSheet(context, controller),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Function untuk menampilkan Bottom Sheet
void _showAddUserSheet(BuildContext context, DataUserController controller) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Tambah Pengguna",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Input Nama
          TextField(
            controller: controller.nameController,
            decoration: const InputDecoration(labelText: "Nama"),
          ),

          // Input Alamat
          TextField(
            controller: controller.addressController,
            decoration: const InputDecoration(labelText: "Alamat"),
          ),

          // Input Email
          TextField(
            controller: controller.emailController,
            decoration: const InputDecoration(labelText: "Email"),
          ),

          // Input Password
          TextField(
            controller: controller.passwordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: "Password"),
          ),

          // Input NIK
          TextField(
            controller: controller.nikController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "NIK"),
          ),
          // tambahkan dropdown
          const SizedBox(height: 10),
          Obx(() {
            return DropdownButtonFormField<String>(
              value: controller
                  .selectedRole.value, // Nilai yang dipilih dari controller
              items: controller.roleList
                  .map((role) => DropdownMenuItem(
                        value: role,
                        child: Text(role),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) controller.selectedRole.value = value;
              },
              decoration: const InputDecoration(
                labelText: "Pilih Role",
                border: OutlineInputBorder(),
              ),
            );
          }),

          const SizedBox(height: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary, // Warna tombol
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Radius sudut
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            onPressed: () {
              if (controller.nameController.text.isNotEmpty &&
                      controller.emailController.text.isNotEmpty &&
                      controller.passwordController.text.isNotEmpty
                  // controller.nikController.text.isNotEmpty
                  ) {
                controller.addUser();
                Get.back(); // Tutup Bottom Sheet
              } else {
                Get.snackbar("Error", "Semua field harus diisi!",
                    backgroundColor: Colors.red, colorText: Colors.white);
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.save,
                    color: Colors.white), // Tambahkan icon refresh
                const SizedBox(width: 8), // Spasi antara icon dan teks
                const Text("Simpan Data",
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          // Tombol Simpan
        ],
      ),
    ),
    isScrollControlled: true,
  );
}

Widget _buildSkeletonList() {
  return ListView.builder(
    itemCount: 5, // Jumlah skeleton yang akan ditampilkan
    itemBuilder: (context, index) {
      return ListTile(
        leading: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
          ),
        ),
        title: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 100,
            height: 10,
            color: Colors.white,
          ),
        ),
        subtitle: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 150,
            height: 10,
            color: Colors.white,
          ),
        ),
      );
    },
  );
}

// Halaman Detail Pengguna
class UserDetailView extends StatelessWidget {
  final DataUserModel user;

  const UserDetailView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama: ${user.name}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Email: ${user.email}", style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
