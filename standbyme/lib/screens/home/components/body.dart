import 'package:flutter/material.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/screens/list/list.dart';

import 'home_screen_background.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        HomeScreenBackground(screenHeight: MediaQuery.of(context).size.height),
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(29.5)),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Pesquisar",
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.search,
                            size: 25,
                          )),
                    ),
                  ),
                  Text(
                    "Carteira",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 500,
                    child: Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: [
                          CategoryCard(
                            img:
                                "https://freepngimg.com/thumb/debit_card/4-2-debit-card-png-hd.png",
                            title: "Cartão",
                            press: () {
                              Navigator.of(context).pushNamed("/bankcard");
                            },
                          ),
                          CategoryCard(
                            img:
                                "https://www.pngrepo.com/png/230804/512/writing-edit.png",
                            title: "Editar cartão",
                            press: () {
                              Navigator.of(context).pushNamed("/editCard");
                            },
                          ),
                          CategoryCard(
                            img:
                                "https://stories.freepiklabs.com/storage/44197/bitcoin-cuate-7077.png",
                            title: "Transações",
                            press: () {
                              Navigator.of(context).pushNamed("/transactions");
                            },
                          ),
                          CategoryCard(
                            img:
                                "https://library.kissclipart.com/20180921/paq/kissclipart-bar-chart-clipart-bar-chart-computer-icons-91a2464f875767ab.png",
                            title: "Gráficos",
                            press: () {
                              Navigator.of(context).pushNamed("/graphics");
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Cozinha",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 300,
                    child: Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: [
                          CategoryCard(
                            img:
                                "https://www.woodmans-food.com/portals/0/COHFood.png",
                            title: "Despensa",
                            press: () {
                              Navigator.of(context).pushNamed("/despensa");
                            },
                          ),
                          CategoryCard(
                            img:
                                "https://freepikpsd.com/media/2019/10/list-cartoon-png-3-Transparent-Images.png",
                            title: "Lista de Compras",
                            press: () {
                              Navigator.of(context).pushNamed("/list");
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
    /*Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 25.0),
            child: _buildContainer(
                150.0, 350.0, Colors.grey.shade50, Colors.grey.shade400)),
        Divider(
          color: Colors.transparent,
        ),
        Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: _buildContainer(
                75.0, 350.0, Colors.tealAccent.shade100, Colors.grey.shade400)),
        Expanded(
          child: Container(
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.fromLTRB(35.0, 40.0, 20.0, 65.0),
                  child: GestureDetector(
                      child: _buildContainerRoxo(),
                      onTap: () {
                        Navigator.of(context).pushNamed('/list');
                      }),
                )),
                Expanded(
                  child: Column(
                    children: [
                      Flexible(
                        child: Padding(
                            padding:
                                EdgeInsets.fromLTRB(25.0, 40.0, 30.0, 35.0),
                            child: _buildContainerCinza()),
                        flex: 3,
                      ),
                      Flexible(
                        child: Padding(
                            padding:
                                EdgeInsets.fromLTRB(25.0, 25.0, 30.0, 65.0),
                            child: _buildContainerLaranja()),
                        flex: 4,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
        Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildContainerRoxo(),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildContainer(80.0, 150.0, Colors.grey.shade200,
                        Colors.grey.shade400),
                    Expanded(
                      child: SizedBox(),
                    ),
                    _buildContainer(120.0, 150.0, Colors.orange.shade400,
                        Colors.grey.shade400),
                  ],
                ))
              ],
            ),
      ],
    );
  }

  Container _buildContainerRoxo() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 3.0, top: 5),
            child: Text(
              "Lista de Compras:",
              style: TextStyle(color: Colors.black, fontSize: 15.0),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kPrimaryColor.withOpacity(0.5),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey[300], blurRadius: 4.0, offset: Offset(4, 8))
          ]),
    );
  }

  Container _buildContainerCinza() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200],
            boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey[400], blurRadius: 4.0, offset: Offset(4, 8))
        ]));
  }

  Container _buildContainerLaranja() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(75, 255, 193, 7),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey[200], blurRadius: 4.0, offset: Offset(4, 8))
          ]),
    );
  }

  Container _buildContainer(altura, largura, cor, corSombra) {
    return Container(
      alignment: Alignment.center,
      width: largura,
      height: altura,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: cor,
          boxShadow: <BoxShadow>[
            BoxShadow(color: corSombra, blurRadius: 4.0, offset: Offset(4, 8))
          ]),
    );
    //}*/
  }
}

class CategoryCard extends StatelessWidget {
  final String img;
  final String title;
  final Function press;
  const CategoryCard({
    Key key,
    this.img,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
                offset: Offset(5, 17),
                blurRadius: 10,
                spreadRadius: -12,
                color: Color(0xFFE6E6E6))
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Image.network(
                    img,
                    height: 90,
                  ),
                ),
                Spacer(),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style:
                      Theme.of(context).textTheme.title.copyWith(fontSize: 18),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
