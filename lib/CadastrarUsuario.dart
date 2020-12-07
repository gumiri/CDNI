import 'package:CDNI/DatabaseProvider.dart';
import 'package:CDNI/Usuario.dart';
import 'package:flutter/material.dart';

class CadastrarUsuario extends StatefulWidget {
  final Usuario usuario;
  CadastrarUsuario({Key key, @required this.usuario}) : super(key: key);
  @override
  _CadastrarUsuario createState() => _CadastrarUsuario();
}

class _CadastrarUsuario extends State<CadastrarUsuario> {
  Usuario _usuario;
  bool _editing;

  final _matriculaController = TextEditingController();
  final _nomeController = TextEditingController();
  final _rgController = TextEditingController();
  final _enderecoController = TextEditingController();

  void initState() {
    super.initState();
    if (widget.usuario == null) {
      _usuario = Usuario();
      _editing = false;
    } else {
      _editing = true;
      _usuario = Usuario.fromMap(widget.usuario.toMap());

      _matriculaController.text = _usuario.matricula.toString();
      _nomeController.text = _usuario.nome.toString();
      _rgController.text = _usuario.rg.toString();
      _enderecoController.text = _usuario.endereco.toString();
    }
  }

  void putValues() {
    print(_matriculaController.text);
    _usuario.matricula = _matriculaController.text;
    _usuario.nome = _nomeController.text;
    _usuario.rg = _rgController.text;
    _usuario.endereco = _enderecoController.text;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar Usuário')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Text('Cadastrar Usuário'),
            Row(
              children: [
                Flexible(
                    child: TextField(
                        controller: _matriculaController,
                        decoration: InputDecoration(
                            hintText: 'Digite a Matrícula',
                            labelText: 'Matrícula'),
                        onChanged: (text) {
                          setState(() {
                            _usuario.matricula = text;
                          });
                        })),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: TextField(
                        controller: _nomeController,
                        decoration: InputDecoration(
                            hintText: 'Digite seu nome', labelText: 'Nome'),
                        onChanged: (text) {
                          setState(() {
                            _usuario.nome = text;
                          });
                        })),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: TextField(
                        controller: _rgController,
                        decoration: InputDecoration(
                            hintText: 'Digite seu RG', labelText: 'RG'),
                        onChanged: (text) {
                          setState(() {
                            _usuario.rg = text;
                          });
                        })),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: TextField(
                        controller: _enderecoController,
                        decoration: InputDecoration(
                            hintText: 'Digite seu endereço',
                            labelText: 'Endereço'),
                        onChanged: (text) {
                          setState(() {
                            _usuario.endereco = text;
                          });
                        })),
              ],
            ),
            RaisedButton(
                child: Text('Salvar'),
                onPressed: () {
                  putValues();
                  if (!_editing) {
                    DatabaseProvider.db.insertUser(_usuario);
                  }
                  else{
                    DatabaseProvider.db
                        .updateUser(_usuario).then((value) => print("Editing"));
                  }

                  Navigator.of(context).popUntil((route) => route.isFirst);
                })
          ]),
        ),
      ),
    );
  }
}
