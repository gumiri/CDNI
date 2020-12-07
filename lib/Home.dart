import 'Cadastrar.dart';
import 'Visualizar.dart';
import 'CadastrarUsuario.dart';
import 'VisualizarUsuario.dart';

import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CDNI'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 130),
          child: Column(
            children: <Widget>[
              Container(
                width: 210,
                height: 50,
                padding: EdgeInsets.all(8),
                              child: ElevatedButton(
                  child: Text('Cadastrar Notificação'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cadastrar()),
                    );
                  },
                ),
              ),
              Container(
                width: 210,
                height: 50,
                padding: EdgeInsets.all(8),
                              child: ElevatedButton(
                  child: Text('Visualizar Notificações'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Visualizar()),
                    );
                  },
                ),
              ),
              Container(
                width: 210,
                height: 50,
                padding: EdgeInsets.all(8),
                              child: ElevatedButton(
                  child: Text('Cadastrar Usuário'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CadastrarUsuario()),
                    );
                  },
                ),
              ),
              Container(
                width: 210,
                height: 50,
                padding: EdgeInsets.all(8),
                              child: ElevatedButton(
                  child: Text('Lista de Usuário'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VisualizarUsuario()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}