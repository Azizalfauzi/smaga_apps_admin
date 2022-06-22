import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smaga_apps_admin_admin/cubit/absensi/absensi_cubit.dart';
import 'package:smaga_apps_admin_admin/cubit/auth/auth_cubit.dart';
import 'package:smaga_apps_admin_admin/cubit/jadwal/jadwal_cubit.dart';
import 'package:smaga_apps_admin_admin/cubit/pengumuman/pengumuman_cubit.dart';
import 'package:smaga_apps_admin_admin/cubit/pengumumancreate/pengumuman_create_cubit.dart';
import 'package:smaga_apps_admin_admin/views/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => PengumumanCubit()),
        BlocProvider(create: (_) => JadwalCubit()),
        BlocProvider(create: (_) => AbsensiCubit()),
        BlocProvider(create: (_) => PengumumanCreateCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        initialRoute: '/',
        routes: {
          '/': ((context) => const SplashScreenPages()),
          '/login-page': ((context) => const LoginPages()),
          '/main-page': ((context) => const MainPage(initialPage: 0)),
          '/data-absensi-page': ((context) => const DataAbsensiPage()),
          '/siswa-page': ((context) => const SiswaPage()),
          '/angkatan-detail-page': ((context) => const DetailAngkatanPage()),
          '/tambah-pengumuman-page': ((context) =>
              const TambahPengumumanPage()),
          '/detail-siswa-page': ((context) => const DetailSiswaPage()),
          '/pengumuman-page': ((context) => const PengumumanPage()),
        },
      ),
    );
  }
}
