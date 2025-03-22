import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_admin_controller.dart';
import '../../../components/custom_appbar.dart';
import '../../../../colors.dart';

class HomeAdminView extends GetView<HomeAdminController> {
  const HomeAdminView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: CustomAppBar(
          title: 'Home Admin',
        ),
      ),
      //  CustomAppBar(title: 'Admin Dashboard'),
      backgroundColor: AppColors.secondary,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Statistics",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 12),
              _buildStatCards(),
            ]),
            // Section: Statistik

            const SizedBox(height: 24),

            // Section: Grid Menu
            Text(
              "Quick Actions",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            _buildGridMenu(),
          ],
        ),
      ),
    );
  }

  // Widget: Statistik Cards
  Widget _buildStatCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _statCard("Users", "150", Icons.people, Colors.blue),
        _statCard("Orders", "45", Icons.shopping_cart, Colors.green),
        _statCard("Revenue", "\$12K", Icons.monetization_on, Colors.orange),
      ],
    );
  }

  Widget _statCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Card(
        color: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget: Grid Menu
  Widget _buildGridMenu() {
    List<Map<String, dynamic>> menuItems = [
      {"title": "Users", "icon": Icons.person, "color": Colors.blue},
      {"title": "Products", "icon": Icons.store, "color": Colors.green},
      {"title": "Orders", "icon": Icons.shopping_cart, "color": Colors.orange},
      {"title": "Analytics", "icon": Icons.bar_chart, "color": Colors.red},
      {"title": "Settings", "icon": Icons.settings, "color": Colors.purple},
      {"title": "Logout", "icon": Icons.logout, "color": Colors.grey},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        return _gridItem(menuItems[index]["title"], menuItems[index]["icon"],
            menuItems[index]["color"]);
      },
    );
  }

  Widget _gridItem(String title, IconData icon, Color color) {
    return Card(
      color: AppColors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          print("$title Clicked");
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
