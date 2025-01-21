import 'dart:io';
import 'package:b2b_client_lk/src/features/common/api/error_interceptor.dart';
import 'package:b2b_client_lk/src/ui/components/show_message.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

mixin ErrorHandler {
  void handleError(Exception e) {
    if (e is SocketException) {
      {
        AppMessages().showMessage(
            'Нет соединения с сервером',
        );
      }
    } else if (e is DioException &&
        (e.message!.contains('Failed host lookup:') ||
            e.message!.contains('Http status error [404]') ||
            e.message!.contains('Unexpected null value'))) {
      AppMessages().showMessage(
        'Нет соединения с сервером',
      );
    } else if (e is DioException && e.error is ApiException) {
      AppMessages().showMessage(
        e.message!,
      );
    } else if (e is UnimplementedError) {
      AppMessages().showMessage('Ошибка при включении уведомлений');
    } else if (e is FirebaseException) {
      if (e.code == 'permission-blocked') {
        AppMessages().showMessage('Уведомления отключены');
      } else {
        AppMessages().showMessage(
          e.toString(),
        );
      }
    } else {
      AppMessages().showMessage(
        e.toString(),
      );
    }
  }
}
