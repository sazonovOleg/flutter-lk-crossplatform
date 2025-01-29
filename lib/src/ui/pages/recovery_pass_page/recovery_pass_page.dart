import 'package:b2b_client_lk/src/ui/pages/recovery_pass_page/recovery_pass_cubit.dart';
import 'package:b2b_client_lk/src/ui/pages/recovery_pass_page/recovery_pass_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecoveryPassPage extends StatefulWidget {
  const RecoveryPassPage({
    super.key,
  });

  @override
  State<RecoveryPassPage> createState() => _WidgetState();
}

class _WidgetState extends State<RecoveryPassPage> {
  @override
  void initState() {
    context.read<RecoveryPassCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RecoveryPassCubit>(context);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: _AppBar(
        bloc: bloc,
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: height / 5),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<RecoveryPassCubit, RecoveryPassState>(
            bloc: bloc,
            builder: (context, state) {
              if (state.authModel!.newPass!.isNotEmpty) {
                return Text('Ваш новый пароль : state.authModel!.newPass!');
              }

              return _RecoveryPass(
                bloc: bloc,
                state: state,
              );
            }),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  final RecoveryPassCubit bloc;

  const _AppBar({
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(
        onPressed: () => bloc.onBackPressed(context),
      ),
      title: const Text('Восстановить пароль'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _RecoveryPass extends StatelessWidget {
  final RecoveryPassCubit bloc;
  final RecoveryPassState state;

  const _RecoveryPass({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Login(
          state: state,
          bloc: bloc,
        ),
        if (state.isShowEmailBtn)
          _Btn(
            onPressed: bloc.recoveryPass,
            btnText: 'Восстановить пароль',
          )
        else
          const Opacity(
            opacity: 0.3,
            child: _Btn(
              onPressed: null,
              btnText: 'Восстановить пароль',
            ),
          ),
      ],
    );
  }
}

class _Login extends StatelessWidget {
  final RecoveryPassState state;
  final RecoveryPassCubit bloc;

  const _Login({
    required this.state,
    required this.bloc,
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
            onChanged: bloc.validateLogin,
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
        if (state.authModel!.message.isNotEmpty) Text(state.authModel!.message),
      ],
    );
  }
}

class _Btn extends StatelessWidget {
  final void Function()? onPressed;
  final String btnText;

  const _Btn({
    required this.onPressed,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 80),
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
        onPressed: onPressed,
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
          btnText,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
