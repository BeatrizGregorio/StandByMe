import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:standbyme_tcc/constants.dart';

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
        //HomeScreenBackground(screenHeight: MediaQuery.of(context).size.height),
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.person),
                    ),
                  ),*/
                  SizedBox(height: 5),
                  /*Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    /*decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(29.5)),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),*/
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Pesquisar",
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 25,
                          )),
                    ),
                  ),*/
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.withOpacity(0.15),
                    ),
                    child: TextField(
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 5.0),
                          ),
                          fillColor: Colors.transparent,
                          hintText: 'Pesquisar...',
                          contentPadding: EdgeInsets.only(left: 10),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: kPrimaryColor,
                            ),
                          )),
                    ),
                  ),
                  Text(
                    "Carteira",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 25,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 200,
                    child: ListView.separated(
                        physics: ClampingScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 10,
                          );
                        },
                        itemCount: 1,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(children: [
                            CategoryCard(
                              img:
                                  "https://cdn-icons-png.flaticon.com/512/1292/1292739.png",
                              title: "Cartões",
                              press: () {
                                Navigator.of(context).pushNamed("/bankcard");
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CategoryCard(
                              img:
                                  "https://cdn-icons-png.flaticon.com/512/1041/1041908.png",
                              title: "Transações",
                              press: () {
                                Navigator.of(context).pushNamed("/cardhome");
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CategoryCard(
                              img:
                                  "https://cdn-icons-png.flaticon.com/512/2779/2779858.png",
                              title: "Editar cartão",
                              press: () {
                                Navigator.of(context)
                                    .pushNamed("/edit_card_screen");
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CategoryCard(
                              img:
                                  "https://cdn-icons-png.flaticon.com/512/1420/1420341.png",
                              title: "Contas",
                              press: () {
                                Navigator.of(context).pushNamed("/contas");
                              },
                            ),
                          ]);
                        }),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Cozinha",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 25,
                        color: kPrimaryColor,
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
                                "https://cdn-icons-png.flaticon.com/512/3845/3845865.png",
                            title: "Despensa",
                            press: () {
                              Navigator.of(context).pushNamed("/despensa");
                            },
                          ),
                          CategoryCard(
                            img:
                                "https://cdn-icons-png.flaticon.com/512/3845/3845758.png",
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
          color: kPrimaryLightColor.withOpacity(0.8),
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
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
