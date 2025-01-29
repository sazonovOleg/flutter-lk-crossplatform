import 'package:b2b_client_lk/src/features/chat/data/chat_repo.dart';
import 'package:b2b_client_lk/src/features/chat/domain/models/chat_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatService {
  final ChatRepo _chatRepo;

  const ChatService(this._chatRepo);

  Future<void> startWebSocket() async => await _chatRepo.startWebSocket();

  WebSocketChannel? getChannel() => _chatRepo.getChannel();

  void sendMessageInChat(String message) {
    final ChatModel chatModel = ChatModel(
      reactUserMessage: message,
      flutterUserMessage: message,
    );

    _chatRepo.sendMessageInChat(chatModel);
  }

  ChatModel getMessagesFromJson(dynamic data) {
    return _chatRepo.getMessageFromJson(data);
  }

  void closeChannel() => _chatRepo.closeChannel();
}
