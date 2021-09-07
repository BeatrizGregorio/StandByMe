import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {
  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Container(
        width: 100.00,
        height: 100.00,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: ExactAssetImage('assets\images\lunaTexto.png'),
            fit: BoxFit.fitHeight,
          ),
        ));
  }
}
