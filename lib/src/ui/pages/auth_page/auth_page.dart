import 'package:b2b_client_lk/src/ui/components/loading_page.dart';
import 'package:b2b_client_lk/src/ui/pages/auth_page/auth_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_page_state.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({
    super.key,
  });

  @override
  State<AuthPage> createState() => _WidgetState();
}

class _WidgetState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthPageCubit>(context);

    return Scaffold(
      appBar: _AppBar(),
      body: _Body(
        bloc: bloc,
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text('Авторизация'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends StatelessWidget {
  final AuthPageCubit bloc;

  const _Body({
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      controller: ScrollController(),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: height / 7),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<AuthPageCubit, AuthPageState>(
          bloc: bloc,
          builder: (context, state) {
            if (state.isLoading) return const LoadingPage();

            return state.registrationMessage.isNotEmpty
                ? Text(
                    state.registrationMessage,
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                : Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          state.isRegistration ? 'Регистрация' : 'Логирование',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      !state.isRegistration
                          ? _Login(
                              bloc: bloc,
                              state: state,
                            )
                          : _Registration(
                              bloc: bloc,
                              state: state,
                            ),
                      _Buttons(
                        bloc: bloc,
                        state: state,
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}

class _RegistrationBtn extends StatelessWidget {
  final AuthPageCubit bloc;
  final AuthPageState state;

  const _RegistrationBtn({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => bloc.setRegistrationView(!state.isRegistration),
        child: Text(
          !state.isRegistration ? 'Регистрация' : 'Войти',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Theme.of(context).colorScheme.error),
        ),
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  final AuthPageCubit bloc;
  final AuthPageState state;

  const _Buttons({required this.bloc, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _RegistrationBtn(
          bloc: bloc,
          state: state,
        ),
        state.isRegistration
            ? _RegistrationButton(
                bloc: bloc,
                state: state,
              )
            : _LoginButton(
                bloc: bloc,
                state: state,
              ),
        _ForgotPassBtn(
          bloc: bloc,
        ),
      ],
    );
  }
}

class _Login extends StatelessWidget {
  final AuthPageCubit bloc;
  final AuthPageState state;

  const _Login({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(3, 4),
              ),
            ],
            border: Border.all(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: bloc.loginController,
            onChanged: bloc.validateEmail,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.account_circle,
                size: 20,
              ),
              contentPadding: EdgeInsets.only(
                top: 13,
                left: 10,
              ),
              hintText: 'Логин',
              isDense: false,
              border: InputBorder.none,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(3, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: bloc.passController,
            obscureText: state.isShowPass,
            onChanged: bloc.validatePass,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.lock,
                size: 20,
              ),
              suffixIcon: InkWell(
                onTap: bloc.showPass,
                child: const Icon(Icons.remove_red_eye),
              ),
              contentPadding: const EdgeInsets.only(
                top: 13,
                left: 10,
              ),
              hintText: 'Пароль',
              isDense: false,
              border: InputBorder.none,
            ),
          ),
        ),
        if (state.authModel != null)
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              state.authModel!.message.isNotEmpty ? state.authModel!.message : '123',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          )
      ],
    );
  }
}

class _LoginButton extends StatelessWidget {
  final AuthPageCubit bloc;
  final AuthPageState state;

  const _LoginButton({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: state.isLogin && state.isPass ? 1 : 0.5,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 55),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 10,
              blurRadius: 15,
              offset: const Offset(3, 7),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: bloc.login,
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(
                vertical: 18,
              ),
            ),
            backgroundColor: WidgetStateProperty.all(
              Theme.of(context).primaryColor,
            ),
          ),
          child: Text(
            'Войти',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}

class _Registration extends StatelessWidget {
  final AuthPageCubit bloc;
  final AuthPageState state;

  const _Registration({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(3, 4),
              ),
            ],
            border: Border.all(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: bloc.loginController,
            onChanged: bloc.validateEmail,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.account_circle,
                size: 20,
              ),
              contentPadding: EdgeInsets.only(
                top: 13,
                left: 10,
              ),
              hintText: 'Новый логин',
              isDense: false,
              border: InputBorder.none,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(3, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: bloc.passController,
            obscureText: state.isShowPass,
            onChanged: bloc.validatePass,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.lock,
                size: 20,
              ),
              suffixIcon: InkWell(
                onTap: bloc.showPass,
                child: const Icon(Icons.remove_red_eye),
              ),
              contentPadding: const EdgeInsets.only(
                top: 13,
                left: 10,
              ),
              hintText: 'Новый пароль',
              isDense: false,
              border: InputBorder.none,
            ),
          ),
        ),
        if (state.authModel != null)
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              state.authModel!.message.isNotEmpty ? state.authModel!.message : '123',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          )
      ],
    );
  }
}

class _RegistrationButton extends StatelessWidget {
  final AuthPageCubit bloc;
  final AuthPageState state;

  const _RegistrationButton({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: state.isLogin && state.isPass ? 1 : 0.5,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 55),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 10,
              blurRadius: 15,
              offset: const Offset(3, 7),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: bloc.registration,
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(
                vertical: 18,
              ),
            ),
            backgroundColor: WidgetStateProperty.all(
              Theme.of(context).primaryColor,
            ),
          ),
          child: Text(
            'Регистрация',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}

class _ForgotPassBtn extends StatelessWidget {
  final AuthPageCubit bloc;

  const _ForgotPassBtn({
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: TextButton(
        onPressed: () => bloc.goToRecoveryPassPage(context),
        child: const Text('Забыли пароль?'),
      ),
    );
  }
}
