import 'dart:async';

import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smaga_apps_admin_admin/cubit/auth/auth_cubit.dart';
import 'package:smaga_apps_admin_admin/cubit/jadwal/jadwal_cubit.dart';
import 'package:smaga_apps_admin_admin/cubit/pengumuman/pengumuman_cubit.dart';
import 'package:smaga_apps_admin_admin/cubit/pengumumancreate/pengumuman_create_cubit.dart';
import 'package:smaga_apps_admin_admin/models/models.dart';
import 'package:smaga_apps_admin_admin/views/theme/theme_data.dart';


import '../widget/widget.dart';
part 'login_pages.dart';
part 'splashscreen_pages.dart';
part 'main_page.dart';
part 'scan_absen_page.dart';
part 'home_page.dart';
part 'profile_page.dart';
part 'data_absensi_page.dart';
part 'detail_angkatan_page.dart';
part 'tambah_pengumuman_page.dart';
part 'detail_siswa_page.dart';
part 'pengumuman_page.dart';
part 'siswa_page.dart';