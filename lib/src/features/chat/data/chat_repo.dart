import 'dart:convert';

import 'package:b2b_client_lk/src/features/chat/data/chat_api.dart';
import 'package:b2b_client_lk/src/features/chat/domain/models/chat_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:web_socket_channel/src/channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class ChatRepo {
  final ChatApi _chatApi;

  const ChatRepo(this._chatApi);

  Future<void> startWebSocket() async => await _chatApi.startWebSocket();

  WebSocketChannel? getChannel() {
    final channel = _chatApi.webSocketChannel.value;

    return channel != null ? channel : null;
  }

  void sendMessageInChat(ChatModel chatModel) {
    final channel = _chatApi.webSocketChannel.value;
    final newJson = chatModelToJson(chatModel);

    if (channel != null) {
      channel.sink.add(newJson);
    }
  }

  ChatModel getMessageFromJson(dynamic data) {
    final json = jsonDecode(data);
    final chatModel = chatModelFromJson(json);

    return chatModel;
  }

  void closeChannel() {
    final channel = _chatApi.webSocketChannel.value;

    if (channel != null) {
      channel.sink.close(status.goingAway);
    }
  }
}
