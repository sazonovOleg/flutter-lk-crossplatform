import 'package:b2b_client_lk/src/features/auth/domain/auth_service.dart';
import 'package:b2b_client_lk/src/features/user_data/domain/models/user_data_model.dart';
import 'package:b2b_client_lk/src/features/user_data/domain/user_data_service.dart';
import 'package:b2b_client_lk/src/ui/web/pages/catalog_page/catalog_page_route.dart';
import 'package:b2b_client_lk/src/ui/web/pages/profile_page/profile_page_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfilePageCubit extends Cubit<ProfilePageState> {
  final AuthService _authService;
  final UserDataService _userDataService;

  ProfilePageCubit(
    this._authService,
    this._userDataService,
  ) : super(ProfilePageState(userData: UserData.empty()));

  Future<void> init() async {
    await initUserData();
  }

  Future<void> initUserData() async {
    final userData = await _userDataService.getUserData();
    emit(ProfilePageState(userData: userData));
  }

  Future<void> onBackPressed(BuildContext context) async {
    context.canPop() ? context.pop() : context.pushNamed(CatalogPageRoute.pageName);
  }

  Future<void> logout(BuildContext context) async {
    await _authService.logoOut();

    if (context.mounted) context.pop();
  }
}
