import 'package:b2b_client_lk/src/di/providers.dart';
import 'package:b2b_client_lk/src/features/common/hive_storage/hive_adapters.dart';
import 'package:b2b_client_lk/src/features/common/shared_pref/shared_pref.dart';
import 'package:b2b_client_lk/src/ui/app/app.dart';
import 'package:b2b_client_lk/src/ui/app/app_vm.dart';
import 'package:b2b_client_lk/src/ui/common/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await Hive.initFlutter();
  RegisterHive().registerHiveAdapters();
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(
    Providers(
      child: ChangeNotifierProvider(
        create: (context) => AppVM(
          context.read<MainTheme>(),
          context.read<SharedPref>(),
        ),
        builder: (context, _) {
          return const App();
        },
      ),
    ),
  );
}
