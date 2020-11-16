import 'dart:ffi';
import 'Notificacao.dart';
import 'package:flutter/material.dart';

class Cadastrar extends StatefulWidget {
  final Notificacao notificacao;

  Cadastrar({this.notificacao});
  @override
  _Cadastrar createState() => _Cadastrar();
}

class _Cadastrar extends State<Cadastrar> {
  Notificacao _editedNotificacao;
  NotificacaoHelper helper;

  final _folhaController = TextEditingController();
  final _dataController = TextEditingController();
  final _horarioController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _numeroController = TextEditingController();
  final _complementoController = TextEditingController();
  final _bairroController = TextEditingController();
  final _municipioController = TextEditingController();
  final _fiscalController = TextEditingController();
  final _clienteController = TextEditingController();
  final _matriculaController = TextEditingController();
  final _rgController = TextEditingController();
  DropDown problemaWidget = DropDown('Construir caixa de inspeção', [
    'Construir caixa de inspeção',
    'Construir caixa de gordura',
    'Construir caixa de retenção de óleo e area'
  ]);
  String problemas;
  @override
  void setState(fn) {
    // TODO: implement setState
    problemas = problemaWidget.getValue();
  }

  @override
  void initState() {
    super.initState();

    if (widget.notificacao == null) {
      _editedNotificacao = Notificacao();
    } else {
      _editedNotificacao = Notificacao.fromMap(widget.notificacao.toMap());

      _folhaController.text = _editedNotificacao.folha.toString();
      _dataController.text = _editedNotificacao.data.toString();
      _horarioController.text = _editedNotificacao.horario.toString();
      _enderecoController.text = _editedNotificacao.endereco;
      _numeroController.text = _editedNotificacao.numero.toString();
      _complementoController.text = _editedNotificacao.complemento;
      _bairroController.text = _editedNotificacao.bairro;
      _municipioController.text = _editedNotificacao.municipio;
      problemaWidget.setValue(_editedNotificacao.problema);
      _fiscalController.text = _editedNotificacao.fiscal;
      _clienteController.text = _editedNotificacao.cliente;
      _matriculaController.text = _editedNotificacao.matricula;
      _rgController.text = _editedNotificacao.rg;
    }
  }

  void putValues() {
    _editedNotificacao.folha = int.parse(_folhaController.text);
    _editedNotificacao.data = int.parse(_dataController.text);
    _editedNotificacao.horario = int.parse(_horarioController.text);
    _editedNotificacao.endereco = _enderecoController.text;
    _editedNotificacao.numero = int.parse(_numeroController.text);
    _editedNotificacao.complemento = _complementoController.text;
    _editedNotificacao.bairro = _bairroController.text;
    _editedNotificacao.municipio = _municipioController.text;
    _editedNotificacao.problema = problemas;
    _editedNotificacao.fiscal = _fiscalController.text;
    _editedNotificacao.cliente = _clienteController.text;
    _editedNotificacao.matricula = _matriculaController.text;
    _editedNotificacao.rg = _rgController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Notificação"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Text(
              'Notificação de Irregularidade',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              children: [
                Flexible(
                    child: TextField(
                    controller: _folhaController,
        decoration: InputDecoration(
          hintText: 'Digite o número da folha',
          labelText: 'Folha de Campo N°',
        ),
        onChanged: (text) {
          setState(() {
            _editedNotificacao.folha = int.parse(text);
          });
        })),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: TextField(
                    controller: _dataController,
        decoration: InputDecoration(
          hintText: 'Digite a data',
          labelText: 'Data',
        ),
        onChanged: (text) {
          setState(() {
            _editedNotificacao.data = int.parse(text);
          });
        })),
                Flexible(
                    child: TextField(
                    controller: _horarioController,
        decoration: InputDecoration(
          hintText: 'Digite o horário',
          labelText: 'Horário',
        ),
        onChanged: (text) {
          setState(() {
            _editedNotificacao.horario = int.parse(text);
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
          hintText: 'Digite o endereço',
          labelText: 'Endereço',
        ),
        onChanged: (text) {
          setState(() {
            _editedNotificacao.endereco = text;
          });
        })),
                Flexible(
                    child: TextField(
                    controller: _numeroController,
        decoration: InputDecoration(
          hintText: 'Digite o número',
          labelText: 'N°',
        ),
        onChanged: (text) {
          setState(() {
            _editedNotificacao.numero = int.parse(text);
          });
        })),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: TextField(
                    controller: _complementoController,
        decoration: InputDecoration(
          hintText: 'Digite o complemento',
          labelText: 'Complemento',
        ),
        onChanged: (text) {
          setState(() {
            _editedNotificacao.complemento = text;
          });
        })),
                Flexible(
                    child: TextField(
                    controller: _bairroController,
        decoration: InputDecoration(
          hintText: 'Digite o bairro',
          labelText: 'Bairro',
        ),
        onChanged: (text) {
          setState(() {
            _editedNotificacao.bairro = text;
          });
        })),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: TextField(
                    controller: _municipioController,
        decoration: InputDecoration(
          hintText: 'Digite o município',
          labelText: 'Município',
        ),
        onChanged: (text) {
          setState(() {
            _editedNotificacao.municipio = text;
          });
        })),
              ],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text(
                'Problemas Detectados pelo agente',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.left,
              ),
            ),
            problemaWidget,
            Row(
              children: [
                Flexible(
                    child: TextField(
                    controller: _fiscalController,
        decoration: InputDecoration(
          hintText: 'Digite o fiscal',
          labelText: 'Fiscal°',
        ),
        onChanged: (text) {
          setState(() {
            _editedNotificacao.fiscal = text;
          });
        })),
                Flexible(
                    child: TextField(
                    controller: _clienteController,
        decoration: InputDecoration(
          hintText: 'Digite o nome do cliente',
          labelText: 'Cliente',
        ),
        onChanged: (text) {
          setState(() {
            _editedNotificacao.cliente = text;
          });
        })),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: TextField(
                    controller: _matriculaController,
        decoration: InputDecoration(
          hintText: 'Digite a matrícula',
          labelText: 'Matrícula',
        ),
        onChanged: (text) {
          setState(() {
            _editedNotificacao.matricula = text;
          });
        })),
                Flexible(
                    child: TextField(
                    controller: _rgController,
        decoration: InputDecoration(
          hintText: 'Digite o rg',
          labelText: 'RG',
        ),
        onChanged: (text) {
          setState(() {
            _editedNotificacao.rg = text;
          });
        })),
              ],
            ),
            RaisedButton(
                onPressed: () {
                  Navigator.pop(context, putValues());
                },
                child: Text('Salvar')),
          ]),
        ),
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  String dropdownValue;
  List<String> dropdownList;
  DropDown(String dropdownValue, List<String> dropdownList) {
    this.dropdownList = dropdownList;
    this.dropdownValue = dropdownValue;
  }
  String getValue() {
    return this.dropdownValue;
  }

  String setValue(String dropdownValue) {
    this.dropdownValue = dropdownValue;
  }

  @override
  _DropDown createState() => _DropDown(dropdownValue, dropdownList);
}

class _DropDown extends State<DropDown> {
  String dropdownValue;
  List<String> dropdownList;
  _DropDown(String dropdownValue, List<String> dropdownList) {
    this.dropdownValue = dropdownValue;
    this.dropdownList = dropdownList;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: dropdownList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
