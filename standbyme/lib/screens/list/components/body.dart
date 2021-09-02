import 'dart:convert';
//import 'dart:html';
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:standbyme_tcc/constants.dart';
//import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/size_config.dart';

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  final controller = TextEditingController();
  List listaCompras = [];
  Map<String, dynamic> ultimoRemovido;
  int ultimoRemovidoPos;

  @override
  void initState() {
    super.initState();
    readData().then((data) {
      setState(() {
        listaCompras = json.decode(data);
      });
    });
  }

  void adicionar() {
    setState(() {
      Map<String, dynamic> newItem = Map();
      newItem["title"] = controller.text;
      controller.text = "";
      newItem["ok"] = false;
      listaCompras.add(newItem);

      saveData();
    });
  }

  Future<Null> refresh() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      listaCompras.sort((a, b) {
        if (a["ok"] && !b["ok"])
          return 1;
        else if (!a["ok"] && b["ok"])
          return -1;
        else
          return 0;
      });
      saveData();
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(200, 153, 51, 153),
          iconTheme: IconThemeData(color: Colors.black),
          shadowColor: Colors.transparent,
          title: Image.asset(
            "assets/images/logo_porta.PNG",
            height: SizeConfig.screenHeight * 0.08,
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.0),
            ),
          ]),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(20.0, 12.0, 5.0, 2.0),
            child: Text(
              "Lista de compras",
              style: TextStyle(
                fontSize: 20,
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 20.0, 17.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      labelText: 'Novo Produto',
                      labelStyle: TextStyle(color: kPrimaryColor)),
                )),
                SizedBox(width: 10),
                RaisedButton(
                  color: kPrimaryColor,
                  child: Text("+"),
                  textColor: Colors.white,
                  onPressed: adicionar,
                )
              ],
            ),
          ),
          Expanded(
              child: RefreshIndicator(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 10.0),
                itemCount: listaCompras.length,
                itemBuilder: buildItem),
            onRefresh: refresh,
          )),
        ],
      ),
    );
  }

  Widget buildItem(context, index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        activeColor: Color.fromARGB(200, 153, 51, 153),
        title: Text(listaCompras[index]["title"]),
        value: listaCompras[index]["ok"],
        secondary: CircleAvatar(
          backgroundColor: Color.fromARGB(200, 153, 51, 153),
          child: Icon(
            listaCompras[index]["ok"] ? Icons.check_outlined : Icons.circle,
            color: Colors.white,
          ),
        ),
        onChanged: (c) {
          setState(() {
            listaCompras[index]["ok"] = c;
          });
        },
      ),
      onDismissed: (direction) {
        setState(() {
          ultimoRemovido = Map.from(listaCompras[index]);
          ultimoRemovidoPos = index;
          listaCompras.removeAt(index);
          saveData();
          final snack = SnackBar(
            content: Text(
                "O item \"${ultimoRemovido["title"]}\" foi removido da sua lista de compras!"),
            action: SnackBarAction(
                label: "Desfazer",
                onPressed: () {
                  setState(() {
                    listaCompras.insert((ultimoRemovidoPos), ultimoRemovido);
                    saveData();
                  });
                }),
            duration: Duration(seconds: 3),
          );
          Scaffold.of(context).removeCurrentSnackBar(); // ADICIONE ESTE COMANDO
          Scaffold.of(context).showSnackBar(snack);
        });
      },
    );
  }

/*
  return CheckboxListTile(
      activeColor: Color.fromARGB(200, 153, 51, 153),
      title: Text(listaCompras[index]["title"]),
      value: listaCompras[index]["ok"],
      secondary: CircleAvatar(
        backgroundColor: Color.fromARGB(200, 153, 51, 153),
        child: Icon(
          listaCompras[index]["ok"] ? Icons.check : Icons.add,
          color: Colors.white,
        ),
      ),
      onChanged: (c) {
        setState(() {
          listaCompras[index]["ok"] = c;
        });
      },
    );
*/
  Future<io.File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return io.File("${directory.path}/data.json");
  }

  Future<io.File> saveData() async {
    String data = json.encode(listaCompras);

    final file = await getFile();
    return file.writeAsString(data);
  }

  Future<String> readData() async {
    try {
      final file = await getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
