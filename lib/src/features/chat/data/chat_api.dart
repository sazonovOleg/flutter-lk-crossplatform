import 'dart:io';

import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatApi {
  final _wsUrl = Uri.parse('ws://127.0.0.1:3030/');
  final _webSocketChannel = BehaviorSubject<WebSocketChannel?>.seeded(null);

  ValueStream<WebSocketChannel?> get webSocketChannel => _webSocketChannel.stream;

  Future<void> startWebSocket() async {
    final channel = WebSocketChannel.connect(_wsUrl);

    try {
      await channel.ready;
      _webSocketChannel.value = channel;
    } on SocketException catch (e) {
      print('ERROR SocketException --------- ${e}');
      _webSocketChannel.value = null;
    } on WebSocketChannelException catch (e) {
      print('ERROR WebSocketChannelException ------ ${e}');
      _webSocketChannel.value = null;
    }
  }
}