import 'package:b2b_client_lk/src/ui/components/loading_page.dart';
import 'package:b2b_client_lk/src/ui/pages/profile_page/profile_page_cubit.dart';
import 'package:b2b_client_lk/src/ui/pages/profile_page/profile_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _State();
}

class _State extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProfilePageCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ProfilePageCubit>(context);

    return BlocBuilder<ProfilePageCubit, ProfilePageState>(
      bloc: bloc,
      builder: (context, state) => Scaffold(
        appBar: _AppBar(
          bloc: bloc,
        ),
        body: state.isLoading
            ? LoadingPage()
            : state.userData!.name.isNotEmpty
                ? _Body(
                    bloc: bloc,
                    state: state,
                  )
                : null,
        bottomSheet: state.userData!.name.isNotEmpty && !state.isLoading
            ? _LogoutBtn(
                bloc: bloc,
              )
            : _UpdateProfileBtn(
                bloc: bloc,
                state: state,
              ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  final ProfilePageCubit bloc;

  const _AppBar({
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: BackButton(
        onPressed: () => bloc.onBackPressed(context),
      ),
      title: const Text('Профиль'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends StatelessWidget {
  final ProfilePageCubit bloc;
  final ProfilePageState state;

  const _Body({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text('Имя: ${state.userData!.name}'),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text('Имя: ${state.userData!.token}'),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _LogoutBtn extends StatelessWidget {
  final ProfilePageCubit bloc;

  const _LogoutBtn({
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          onPressed: () => bloc.logout(context),
          child: const Text(
            'Выйти',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _UpdateProfileBtn extends StatelessWidget {
  final ProfilePageCubit bloc;
  final ProfilePageState state;

  const _UpdateProfileBtn({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(state.errorMessage),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: bloc.updateUserData,
              child: const Text(
                'Обновить данные профиля',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
