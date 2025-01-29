import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

String chatModelToJson(ChatModel data) => json.encode(_$ChatModelToJson(data));

ChatModel chatModelFromJson(Map<String, dynamic> data) => _$ChatModelFromJson(data);

@JsonSerializable()
class ChatModel {
  ChatModel({
    required this.reactUserMessage,
    required this.flutterUserMessage,
  });

  @JsonKey(name: 'reactUserMessage')
  String reactUserMessage;
  @JsonKey(name: 'flutterUserMessage')
  String flutterUserMessage;

  ChatModel.empty()
      : reactUserMessage = '',
        flutterUserMessage = '';
}
