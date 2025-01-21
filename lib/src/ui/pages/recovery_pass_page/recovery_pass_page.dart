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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RecoveryPassCubit>();
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
            if (state.isRecovery) {
              return _RecoveryCode(
                bloc: bloc,
                state: state,
              );
            }

            if (state.isNewPassword) {
              return _SyncPass(
                state: state,
                bloc: bloc,
              );
            }

            return _RecoveryPass(
              bloc: bloc,
              state: state,
            );
          },
        ),
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
        _Email(
          bloc: bloc,
        ),
        if (state.isShowEmailBtn)
          _Btn(
            onPressed: bloc.recoveryPass,
            btnText: 'Восстановить пароль',
          )
        else
          const Opacity(
            opacity: 0.7,
            child: _Btn(
              onPressed: null,
              btnText: 'Восстановить пароль',
            ),
          ),
      ],
    );
  }
}

class _Email extends StatelessWidget {
  final RecoveryPassCubit bloc;

  const _Email({
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
            controller: bloc.emailController,
            onChanged: bloc.validateEmail,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                size: 20,
              ),
              contentPadding: EdgeInsets.only(
                top: 13,
                left: 10,
              ),
              hintText: 'Адрес электронной почты',
              isDense: false,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}

class _RecoveryCode extends StatelessWidget {
  final RecoveryPassCubit bloc;
  final RecoveryPassState state;

  const _RecoveryCode({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _RecoveryCodeTextField(
          bloc: bloc,
          state: state,
        ),
        if (state.enabledVerifyBtn)
          _Btn(
            onPressed: bloc.checkRecoveryCode,
            btnText: 'Продолжить',
          )
        else
          const Opacity(
            opacity: 0.7,
            child: _Btn(
              onPressed: null,
              btnText: 'Продолжить',
            ),
          ),
      ],
    );
  }
}

class _RecoveryCodeTextField extends StatelessWidget {
  final RecoveryPassCubit bloc;
  final RecoveryPassState state;

  const _RecoveryCodeTextField({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            textAlign: TextAlign.center,
            'Введите 6-значный код, который мы отправили на эл.адрес ${state.userEmail}',
          ),
        ),
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
            controller: bloc.recoveryCodeController,
            onChanged: bloc.validateCode,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(
                top: 5,
                left: 10,
              ),
              hintText: 'Введите проверочный код',
              isDense: false,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}

class _SyncPass extends StatelessWidget {
  final RecoveryPassCubit bloc;
  final RecoveryPassState state;

  const _SyncPass({
    required this.state,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            bottom: 10,
          ),
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
            controller: bloc.enteredPassController,
            obscureText: state.isShowNewPass,
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: bloc.showNewPassword,
                child: const Icon(
                  Icons.remove_red_eye_sharp,
                  size: 20,
                ),
              ),
              contentPadding: const EdgeInsets.only(
                top: 13,
                left: 10,
              ),
              hintText: 'Введите пароль',
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
            controller: bloc.confirmPassController,
            obscureText: state.isShowConfirmPass,
            onChanged: bloc.validatePass,
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: bloc.showConfirmPass,
                child: const Icon(
                  Icons.remove_red_eye_sharp,
                  size: 20,
                ),
              ),
              contentPadding: const EdgeInsets.only(
                top: 13,
                left: 10,
              ),
              hintText: 'Повторите пароль',
              isDense: false,
              border: InputBorder.none,
            ),
          ),
        ),
        if (state.enabledConfirmPassBtn)
          _Btn(
            onPressed: () => bloc.setNewPass(context),
            btnText: 'Продолжить',
          )
        else
          const Opacity(
            opacity: 0.7,
            child: _Btn(
              onPressed: null,
              btnText: 'Продолжить',
            ),
          ),
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
            const Color(
              0xFFFF6347,
            ),
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
