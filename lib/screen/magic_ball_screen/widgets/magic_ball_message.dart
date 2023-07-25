import 'package:flutter/material.dart';

class MagicBallMessage extends StatelessWidget {
  final String msg;
  final bool isError;
  const MagicBallMessage({
    super.key,
    required this.msg,
    required this.isError,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      msg,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: isError ? 12.0 : 32.0, color: Colors.white),
    );
  }
}
