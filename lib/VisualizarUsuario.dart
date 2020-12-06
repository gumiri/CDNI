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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseProvider.db.getUsersData().then((value) => setState(() {
          dbList = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Agentes"),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: dbList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                'Nome: ${dbList[index].nome}',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                  'Matrícula: ${dbList[index].matricula}'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AgenteDetail(usuario: dbList[index]))).then((value) => DatabaseProvider.db.getUsersData().then((value) => setState(() {
          dbList = value;
        })));
              },
            );
          }),
    );
  }
}
