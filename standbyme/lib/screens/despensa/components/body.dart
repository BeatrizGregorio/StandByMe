import 'package:flutter/material.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/screens/despensa/components/itensAtuais.dart';
import 'package:standbyme_tcc/screens/despensa/components/listaProdutos.dart';
//import 'package:standbyme_tcc/screens/despensa/components/receitasFavoritas.dart';
//import 'package:standbyme_tcc/screens/despensa/components/refeicoes.dart';
//import 'package:standbyme_tcc/screens/list/components/body.dart';
//import 'package:standbyme_tcc/size_config.dart';

//import 'package:tuple/tuple.dart';
class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
      body: Stack(children: [
        PageView(
          controller: _pageController,
          onPageChanged: (p) {
            setState(() {
              _page = p;
            });
          },
          children: [
            ItensAtuais(),
            ListaProdutos(),
            //Refeicoes(),
            //ReceitasFavoritas()
          ],
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _page,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.food_bank,
              size: 37,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_basket,
              size: 32,
            ),
            label: '',
          ),
          /*
          BottomNavigationBarItem(
            icon: Icon(
              Icons.restaurant,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 30,
            ),
            label: '',
          ),*/
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(_selectedIndex,
        duration: Duration(milliseconds: 250), curve: Curves.ease);
  }
}
