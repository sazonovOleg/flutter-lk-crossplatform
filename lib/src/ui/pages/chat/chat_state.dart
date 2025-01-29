import 'package:b2b_client_lk/src/features/chat/domain/models/chat_model.dart';

class ChatPageState {
  final bool isLoading;
  final bool isSendBtn;
  ChatModel? chatModel = ChatModel.empty();
  List<String>? listReactMessages = [];
  List<String>? listFlutterMessages = [];

  ChatPageState({
    this.isLoading = true,
    this.isSendBtn = false,
    this.chatModel,
    this.listReactMessages,
    this.listFlutterMessages,
  });
}
