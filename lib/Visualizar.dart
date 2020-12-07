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
  List<Notificacao> filterList = List();
  bool isSearching = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseProvider.db.getData().then((value) => setState(() {
          dbList = filterList = value;
        }));
  }

  void _filter(value) {
    setState(() {
      filterList = dbList
          .where((element) =>
              element.endereco.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: !isSearching
            ? Text("Visualizar Notificação")
            : TextField(
                onChanged: (value) {
                  _filter(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(hintText: "Pesquisar")),
        actions: <Widget>[
          !isSearching
              ? IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = !this.isSearching;
                    });
                  })
              : IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearching = !this.isSearching;
                      filterList = dbList;
                    });
                  })
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: filterList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                'Endereço: ${filterList[index].endereco}',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                  'Bairro: ${filterList[index].bairro}\nCliente: ${dbList[index].cliente}'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(
                            notificacao: filterList[index]))).then((value) =>
                    DatabaseProvider.db.getData().then((value) => setState(() {
                          filterList = dbList = value;
                        })));
              },
            );
          }),
    );
  }
}
