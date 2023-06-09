import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snake_game/utils/constants.dart';

import '../../providers/snake_commands_provider.dart';

class InitAlertDialog extends StatefulWidget {
  const InitAlertDialog({super.key});

  @override
  State<InitAlertDialog> createState() => _InitAlertDialogState();
}

class _InitAlertDialogState extends State<InitAlertDialog> {
  SnakeCommandsProvider snakeProvider = SnakeCommandsProvider();

  @override
  Widget build(BuildContext context) {
    final gameProvider = context.watch<SnakeCommandsProvider>();
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Column(
        children: [
          Image.asset(AppConstants.appLogoPath),
          const Text(AppConstants.welcomeMessage,
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        ],
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            RichText(
              text: const TextSpan(
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text: AppConstants.startGameMessage),
                  TextSpan(
                      text: AppConstants.playInfo,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(text: AppConstants.buttonInfo),
                ],
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        Column(
          children: [
            ElevatedButton(
              style: TextButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                backgroundColor: Colors.black87,
              ),
              onPressed: () {
                gameProvider.playBackgroundSound();
                Navigator.of(context).pop();
              },
              child: const Text('PLAY', style: TextStyle(color: Colors.white)),
            ),
            const Text('version 1.0', style: TextStyle(color: Colors.black))
          ],
        ),
      ],
    );
  }
}
