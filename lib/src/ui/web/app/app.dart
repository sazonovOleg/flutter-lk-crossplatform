import 'package:b2b_client_lk/src/ui/web/common/keys.dart';
import 'package:b2b_client_lk/src/ui/web/common/router/router_config.dart';
import 'package:b2b_client_lk/src/ui/web/common/scroll_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_vm.dart';

class App extends StatefulWidget {
  const App({
    super.key,
  });

  @override
  State<App> createState() => _WebAppState();
}

class _WebAppState extends State<App> {
  @override
  void initState() {
    super.initState();
    context.read<AppVM>().init();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.read<AppVM>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scrollBehavior: CustomScrollBehavior(),
      scaffoldMessengerKey: Keys.messengerKey,
      theme: vm.setTheme(context),
      routerConfig: routerConfig,
    );
  }
}
