import 'package:flutter/material.dart';
import 'package:standbyme_tcc/constants.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
            padding: EdgeInsets.only(top: 25.0),
            child: _buildContainer(100.0, 350.0, Colors.tealAccent.shade100,
                Colors.grey.shade400)),
        Expanded(
          child: Container(
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(35.0, 40.0, 20.0, 65.0),
                  child: _buildContainerRoxo(),
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
        /*Row(
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
            ),*/
      ],
    );
  }

  Container _buildContainerRoxo() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kPrimaryColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey[400], blurRadius: 4.0, offset: Offset(4, 8))
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
  }
}
