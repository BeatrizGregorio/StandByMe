//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:standbyme_tcc/components/custom_drawer.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/screens/chatbot_LunaTexto/chatbot_LunaTexto.dart';
//import 'package:standbyme_tcc/screens/bank/bank_card.dart';
import 'package:standbyme_tcc/screens/chatbot_Tina/chatbot_Tina.dart';
import 'package:standbyme_tcc/screens/home/components/body.dart';
import 'package:standbyme_tcc/screens/home/components/home_screen_background.dart';

import '../../size_config.dart';
import '../calendar/calendar_screen.dart';
import '../chatbot_Luna/chatbot_Luna.dart';
import '../chatbot_Otto/chatbot_Otto.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(_pageController),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        shadowColor: Colors.transparent,
        title: Image.asset(
          "assets/images/logo_porta.PNG",
          height: SizeConfig.screenHeight * 0.08,
        ),
        backgroundColor: Color.fromARGB(200, 153, 51, 153),
        centerTitle: true,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: Icon(
                  Icons.account_circle_sharp,
                  color: Colors.black.withOpacity(0.6),
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/profile_screen');
                },
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(children: [
        HomeScreenBackground(screenHeight: MediaQuery.of(context).size.height),
        PageView(
          controller: _pageController,
          onPageChanged: (p) {
            setState(() {
              _page = p;
            });
          },
          children: [
            Body(),
            CalendarScreen(),
            Chatbot_LunaTexto(),
            Chatbot_Otto(),
            Chatbot_Tina(),
          ],
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 30.0,
        currentIndex: _page,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today_rounded,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/luna_preta.png",
              height: SizeConfig.screenHeight * 0.05,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/otto_oficial.PNG",
              height: SizeConfig.screenHeight * 0.05,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/tina.PNG",
              height: SizeConfig.screenHeight * 0.05,
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(_selectedIndex,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
}
