import 'dart:async';

import 'package:b2b_client_lk/src/features/chat/domain/chat_service.dart';
import 'package:b2b_client_lk/src/features/chat/domain/models/chat_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_state.dart';

class ChatPageCubit extends Cubit<ChatPageState> {
  final ChatService _chatService;

  ChatPageCubit(this._chatService) : super(ChatPageState());

  TextEditingController loginController = TextEditingController();
  late StreamSubscription? _streamSubscription;
  ChatModel? chatModel = ChatModel.empty();

  Future<void> init() async {
    emit(ChatPageState(isLoading: true, listReactMessages: [], listFlutterMessages: []));

    await _chatService.startWebSocket();

    emit(ChatPageState(
      isLoading: false,
      listFlutterMessages: state.listFlutterMessages,
      listReactMessages: state.listReactMessages,
    ));

    _streamSubscription = _chatService.getChannel()?.stream.listen((data) {
      if (data != null) {
        chatModel = _chatService.getMessagesFromJson(data);

        emit(ChatPageState(
          chatModel: chatModel,
          listFlutterMessages: state.listFlutterMessages,
          listReactMessages: state.listReactMessages,
        ));

        setListReactMessages();
      }
    });
  }

  void setListReactMessages() {
    final list = state.listReactMessages;

    if (state.chatModel != null) {
      if (state.chatModel!.reactUserMessage.isNotEmpty) {
        list!.add(state.chatModel!.reactUserMessage);

        emit(ChatPageState(
          chatModel: chatModel,
          listReactMessages: list,
          listFlutterMessages: state.listFlutterMessages,
        ));
      }
    }
  }

  void setListFlutterMessages() {
    final list = state.listFlutterMessages;
    list!.add(loginController.text);

    emit(ChatPageState(
      chatModel: chatModel,
      listReactMessages: state.listReactMessages,
      listFlutterMessages: list,
    ));
  }

  void validateSendMsgBtn(String value) {
    final isShow = value.length >= 1;

    emit(
      ChatPageState(
        isSendBtn: isShow,
        chatModel: chatModel,
        listReactMessages: state.listReactMessages,
        listFlutterMessages: state.listFlutterMessages,
      ),
    );
  }

  void sendMessage() {
    if (loginController.text.length >= 1) {
      _chatService.sendMessageInChat(loginController.text);
      setListFlutterMessages();
      loginController.clear();
    }
  }

  @override
  Future<void> close() {
    _chatService.closeChannel();
    _streamSubscription?.cancel();
    return super.close();
  }
}
