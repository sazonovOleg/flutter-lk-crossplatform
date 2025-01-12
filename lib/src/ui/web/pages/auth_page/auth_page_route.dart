import 'package:b2b_client_lk/src/features/auth/domain/auth_service.dart';
import 'package:b2b_client_lk/src/ui/web/pages/auth_page/auth_page.dart';
import 'package:b2b_client_lk/src/ui/web/pages/auth_page/auth_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthPageRoute extends GoRoute {
  static const pageName = 'Auth page';
  static const route = '/auth';

  AuthPageRoute()
      : super(
    path: route,
    name: pageName,
    builder: (context, state) => BlocProvider(
      create: (context) => AuthPageCubit(
        context.read<AuthService>(),
      ),
      child: const AuthPage(),
    ),
  );
}
