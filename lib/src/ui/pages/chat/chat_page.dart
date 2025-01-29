import 'package:b2b_client_lk/src/ui/pages/chat/chat_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_cubit.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    context.read<ChatPageCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ChatPageCubit>(context);

    return BlocBuilder<ChatPageCubit, ChatPageState>(
      bloc: bloc,
      builder: (context, state) => Scaffold(
        appBar: _AppBar(),
        body: _Body(
          bloc: bloc,
          state: state,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _MessageInputSender(
          bloc: bloc,
          state: state,
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Text('Чат'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends StatelessWidget {
  final ChatPageCubit bloc;
  final ChatPageState state;

  const _Body({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: state.listReactMessages!.isNotEmpty
                  ? state.listReactMessages!.map((el) => Text('React: ${el}')).toList()
                  : [],
            ),
            SizedBox(width: 30,),
            Column(
              children: state.listFlutterMessages!.isNotEmpty
                  ? state.listFlutterMessages!.map((el) => Text('Flutter: ${el}')).toList()
                  : [],
            ),
          ],
        ),
      )
    );
  }
}

class _MessageInputSender extends StatelessWidget {
  final ChatPageCubit bloc;
  final ChatPageState state;

  const _MessageInputSender({
    required this.state,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 10,
            offset: const Offset(3, 4),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: bloc.loginController,
          onChanged: bloc.validateSendMsgBtn,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              top: 10,
              left: 10,
            ),
            suffixIcon: InkWell(
              onTap: bloc.sendMessage,
              child: Icon(
                Icons.send,
                color: Theme.of(context).primaryColor,
              ),
            ),
            hintText: 'Введите сообщение',
            isDense: false,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
