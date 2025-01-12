import 'package:b2b_client_lk/src/features/auth/domain/auth_service.dart';
import 'package:b2b_client_lk/src/features/user_data/domain/user_data_service.dart';
import 'package:b2b_client_lk/src/ui/web/pages/profile_page/profile_page.dart';
import 'package:b2b_client_lk/src/ui/web/pages/profile_page/profile_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfilePageRoute extends GoRoute {
  static const pageName = 'Profile page';
  static const route = '/profile';

  ProfilePageRoute()
      : super(
    path: route,
    name: pageName,
    builder: (context, state) => BlocProvider(
      create: (context) => ProfilePageCubit(
        context.read<AuthService>(),
        context.read<UserDataService>(),
      ),
      child: const ProfilePage(),
    ),
  );
}
