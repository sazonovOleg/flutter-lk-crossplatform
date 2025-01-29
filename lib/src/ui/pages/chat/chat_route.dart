import 'package:b2b_client_lk/src/features/chat/domain/chat_service.dart';
import 'package:b2b_client_lk/src/ui/pages/chat/chat_cubit.dart';
import 'package:b2b_client_lk/src/ui/pages/chat/chat_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChatPageRoute extends GoRoute {
  static const pageName = 'Chat page';
  static const route = '/chat';

  ChatPageRoute()
      : super(
          path: route,
          name: pageName,
          pageBuilder: (context, state) => NoTransitionPage(
            child: BlocProvider(
              create: (context) => ChatPageCubit(
                context.read<ChatService>(),
              ),
              child: ChatPage(),
            ),
          ),
        );
}
