import 'dart:ffi';
import 'Cadastrar.dart';
import 'Visualizar.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: mainPage(),
  ));
}

class mainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CDNI'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: <Widget>[
              ElevatedButton(
                child: Text('Cadastrar Notificação'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cadastrar()),
                  );
                },
              ),
              ElevatedButton(
                child: Text('Visualizar Notificações'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Visualizar()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
