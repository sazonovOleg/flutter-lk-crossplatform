import 'package:b2b_client_lk/src/ui/web/common/keys.dart';
import 'package:flutter/material.dart';

class AppMessages {
  void showMessage(
    String message, {
    bool goodMessage = false,
  }) {
    Keys.messengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                goodMessage
                    ? Icons.assignment_turned_in
                    : Icons.info_outline_rounded,
                color: goodMessage
                    ? Colors.green
                    : Theme.of(Keys.messengerKey.currentState!.context)
                        .colorScheme
                        .error,
              ),
            ),
            Expanded(
              child: Text(
                message,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showNotify(
    String title,
    String body,
  ) {
    Keys.messengerKey.currentState!.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(Keys.messengerKey.currentState!.context)
            .colorScheme
            .tertiaryContainer
            .withOpacity(0.7),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(Keys.messengerKey.currentState!.context).size.height - 130,
          left: 10,
          right: 10,
        ),
        content: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                children: [
                  Text(title),
                  Text(body),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
