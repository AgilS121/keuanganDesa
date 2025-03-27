import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../colors.dart'; // Sesuaikan dengan path warna

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final Color? statusBarColor;
  final Brightness? statusBarIconBrightness;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.backgroundColor,
    this.statusBarColor,
    this.statusBarIconBrightness = Brightness.light,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      centerTitle: true,
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      backgroundColor: backgroundColor ?? AppColors.secondary,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: statusBarColor ?? AppColors.primary,
        statusBarIconBrightness: statusBarIconBrightness!,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
