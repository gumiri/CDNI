import 'package:CDNI/Detail.dart';
import 'package:CDNI/Notificacao.dart';
import 'package:flutter/material.dart';
import 'DatabaseProvider.dart';

class Visualizar extends StatefulWidget {
  @override
  _Visualizar createState() => _Visualizar();
}

class _Visualizar extends State<Visualizar> {
  List<Notificacao> dbList = List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseProvider.db.getData().then((value) => setState(() {
          dbList = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Notificação"),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: dbList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                'Endereço: ${dbList[index].endereco}',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                  'Bairro: ${dbList[index].bairro}\n Cliente: ${dbList[index].cliente}'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(notificacao: dbList[index]))).then((value) => DatabaseProvider.db.getData().then((value) => setState(() {
          dbList = value;
        })));
              },
            );
          }),
    );
  }
}
