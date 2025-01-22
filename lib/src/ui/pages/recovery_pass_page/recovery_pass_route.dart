import 'package:b2b_client_lk/src/features/auth/domain/auth_service.dart';
import 'package:b2b_client_lk/src/ui/pages/recovery_pass_page/recovery_pass_cubit.dart';
import 'package:b2b_client_lk/src/ui/pages/recovery_pass_page/recovery_pass_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RecoveryPassRoute extends GoRoute {
  static const pageName = 'Recovery pass page';
  static const route = '/recovery-pass';

  RecoveryPassRoute()
      : super(
          path: route,
          name: pageName,
          pageBuilder: (context, state) => NoTransitionPage(
            child: BlocProvider(
              create: (context) => RecoveryPassCubit(
                context.read<AuthService>(),
              ),
              child: const RecoveryPassPage(),
            ),
          ),
        );
}
