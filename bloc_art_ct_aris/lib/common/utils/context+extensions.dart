

import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  void showErrorDialog(String message) {
    if (message.trim().isEmpty) return;
    showDialog(
      barrierDismissible: false,
      context: this,
      builder: (context) => AlertDialog(
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'))
        ],
      ),
    );
  }

  void showLoadingDialog() {
    showDialog(
      barrierDismissible: false,
      context: this,
      builder: (context) => const LoadingDialog(),
    );
  }

  void dismissDialog() {
    Navigator.of(this).pop();
  }
}

class LoadingDialog extends Dialog {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.lightBlue,
      )
    );
  }
}