import 'package:CDNI/Usuario.dart';
import 'package:flutter/material.dart';
import 'DatabaseProvider.dart';
import 'AgenteDetail.dart';

class VisualizarUsuario extends StatefulWidget {
  @override
  _VisualizarUsuario createState() => _VisualizarUsuario();
}

class _VisualizarUsuario extends State<VisualizarUsuario> {
  List<Usuario> dbList = List();
  List<Usuario> filterList = List();
  bool isSearching = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseProvider.db.getUsersData().then((value) => setState(() {
          dbList = filterList = value;
        }));
  }

  void _filter(value) {
    setState(() {
      filterList = dbList
          .where((element) =>
              element.nome.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: !isSearching
            ? Text("Lista de Agentes")
            : TextField(
                onChanged: (value) {
                  _filter(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(hintText: "Pesquisar")),
        actions: [
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
                'Nome: ${filterList[index].nome}',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Matrícula: ${filterList[index].matricula}'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AgenteDetail(usuario: filterList[index]))).then(
                    (value) => DatabaseProvider.db
                        .getUsersData()
                        .then((value) => setState(() {
                              filterList = dbList = value;
                            })));
              },
            );
          }),
    );
  }
}
