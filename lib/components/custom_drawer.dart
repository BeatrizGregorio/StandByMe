import 'package:flutter/material.dart';
import 'package:standbyme_tcc/constants.dart';

class CustomDrawer extends StatelessWidget {
  Widget _buildDrawerBack() => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [kPrimaryLightColor, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [_buildDrawerBack()],
      ),
    );
  }
}
