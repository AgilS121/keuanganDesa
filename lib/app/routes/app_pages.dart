import 'package:get/get.dart';

import '../../bindings/main_admin_binding.dart';
import '../../bindings/main_binding.dart';
import '../../views/main.dart';
import '../../views/main_admin.dart';
import '../modules/DataUser/bindings/data_user_binding.dart';
import '../modules/DataUser/views/data_user_view.dart';
import '../modules/HomeAdmin/bindings/home_admin_binding.dart';
import '../modules/HomeAdmin/bindings/home_admin_binding.dart';
import '../modules/HomeAdmin/views/home_admin_view.dart';
import '../modules/HomeAdmin/views/home_admin_view.dart';
import '../modules/JadwalRonda/bindings/jadwal_ronda_binding.dart';
import '../modules/JadwalRonda/views/jadwal_ronda_view.dart';
import '../modules/Keuangan/bindings/keuangan_binding.dart';
import '../modules/Keuangan/views/keuangan_view.dart';
import '../modules/MenuAdmin/bindings/menu_admin_binding.dart';
import '../modules/MenuAdmin/views/menu_admin_view.dart';
import '../modules/PengumumanUser/bindings/pengumuman_user_binding.dart';
import '../modules/PengumumanUser/views/pengumuman_user_view.dart';
import '../modules/Tagihan/bindings/tagihan_binding.dart';
import '../modules/Tagihan/views/tagihan_view.dart';
import '../modules/User/bindings/user_binding.dart';
import '../modules/User/views/user_view.dart';
import '../modules/Warga/bindings/warga_binding.dart';
import '../modules/Warga/views/warga_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pengumuman/bindings/pengumuman_binding.dart';
import '../modules/pengumuman/views/pengumuman_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/riwayatkeuangan/bindings/riwayatkeuangan_binding.dart';
import '../modules/riwayatkeuangan/views/riwayatkeuangan_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.MAINADMIN,
      page: () => MainAdminView(),
      binding: MainAdminBinding(),
    ),
    GetPage(
      name: _Paths.TAGIHAN,
      page: () => const TagihanView(),
      binding: TagihanBinding(),
    ),
    GetPage(
      name: _Paths.WARGA,
      page: () => const WargaView(),
      binding: WargaBinding(),
    ),
    GetPage(
      name: _Paths.KEUANGAN,
      page: () => const KeuanganView(),
      binding: KeuanganBinding(),
    ),
    GetPage(
      name: _Paths.HOME_ADMIN,
      page: () => const HomeAdminView(),
      binding: HomeAdminBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => const UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.MENU_ADMIN,
      page: () => const MenuAdminView(),
      binding: MenuAdminBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL_RONDA,
      page: () => const JadwalRondaView(),
      binding: JadwalRondaBinding(),
    ),
    GetPage(
      name: _Paths.PENGUMUMAN,
      page: () => PengumumanView(),
      binding: PengumumanBinding(),
    ),
    GetPage(
      name: _Paths.RIWAYATKEUANGAN,
      page: () => const RiwayatkeuanganView(),
      binding: RiwayatkeuanganBinding(),
    ),
    GetPage(
      name: _Paths.DATA_USER,
      page: () => const DataUserView(),
      binding: DataUserBinding(),
    ),
    GetPage(
      name: _Paths.PENGUMUMAN_USER,
      page: () => const PengumumanUserView(),
      binding: PengumumanUserBinding(),
    ),
  ];
}
