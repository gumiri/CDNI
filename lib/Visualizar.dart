import 'package:CDNI/Notificacao.dart';
import 'package:flutter/material.dart';
import 'DatabaseProvider.dart';

class Visualizar extends StatefulWidget {
  @override
  _Visualizar createState() => _Visualizar();
}

class _Visualizar extends State<Visualizar> {
  Widget listView;
  @override
  void initState() {
    // TODO: implement initState
    DatabaseProvider.db.getData().then(
          (value) => {
            print("sladkçfjsdklfjsdl"),
            print(value.length),
            listView = ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              var item = value[index];
              return ListTile(title: Text(item.endereco));
            },
          ),}
        );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Notificação"),
      ),
      body: SingleChildScrollView(
        //child: Column(children: [listView]),
      ));
  }
}
