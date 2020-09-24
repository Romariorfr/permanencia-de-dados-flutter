import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:salvar_dados_na_memoria/source/save-data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //controlador do textfield
  final _editTextController = TextEditingController();

  //instancia da classe que salva os dados
  SaveData acessData = SaveData();

  String _data; //string que armazena dado digitado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("salvar dados em json"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30.0, right: 30.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "digite um dado qualquer"),
              controller: _editTextController,
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                child: Text("Salvar"),
                onPressed: () {
                  _data = _editTextController.text;
                  acessData.saveData(_data);
                  _editTextController.text = "";
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                child: Text("ler dados"),
                onPressed: () {
                  setState(() {
                    acessData
                        .readData()
                        .then((data) => _data = json.decode(data));
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Center(
                child: Text(
                  _data ?? "click em ler dados",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
