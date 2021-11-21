import 'package:flutter/material.dart';

import 'buttons/primary_button.dart';

class Dialogs {
  /// Dialog asking a question and providing yes/cancel options. Dialog can be
  /// closed by system pop or by tapping outside.
  static Future<void> confirmDialog({
    required BuildContext context,
    required String question,
    required String cancelButton,
    required String confirmButton,
    VoidCallback? onSuccess,
    VoidCallback? onFail,
  }) async {
    await showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    question,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            onFail?.call();
                          },
                          text: cancelButton,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: PrimaryButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              onSuccess?.call();
                            },
                            text: confirmButton),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  /// Regular dialog with title, message and single button to dispose the dialog
  /// and to optionally do something when disposed. User is not allowed to
  /// dispose any other way than tapping on the button provided.
  static Future<void> alertDialog({
    required BuildContext context,
    required String continueButton,
    String? message,
    String? title,
    VoidCallback? onContinue,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            onContinue?.call();
            return false;
          },
          child: Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null) ...[
                  Text(
                    title.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
                if (message != null) ...[
                  Text(
                    message,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          onContinue?.call();
                        },
                        text: continueButton,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
