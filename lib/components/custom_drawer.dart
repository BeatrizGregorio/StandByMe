import 'package:flutter/material.dart';
import 'package:standbyme_tcc/components/tiles/drawer_tile.dart';
import 'package:standbyme_tcc/constants.dart';

class CustomDrawer extends StatelessWidget {
  final PageController _pageController;

  CustomDrawer(this._pageController);

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
      child: Stack(children: <Widget>[
        _buildDrawerBack(),
        ListView(
          padding: EdgeInsets.only(left: 32.0, top: 16.0),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 8.0),
              padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
              height: 170.0,
              child: Stack(
                children: <Widget>[
                  Positioned(
                      top: 35.0,
                      left: 0.0,
                      child: Text(
                        "Carteira",
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.black,
                            fontFamily: "Times New Roman"),
                      ))
                ],
              ),
            ),
            Divider(),
            DrawerTile(Icons.wallet_giftcard, "Carteira", "/bank"),
            DrawerTile(Icons.kitchen, "Cozinha", "/kitchen"),
            // DrawerTile(Icons.house, "Casa", 7),
            // DrawerTile(Icons.settings, "Configurações", 8),
          ],
        )
      ]),
    );
  }
}
