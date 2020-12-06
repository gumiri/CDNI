import 'package:CDNI/Cadastrar.dart';
import 'package:CDNI/DatabaseProvider.dart';
import 'package:CDNI/Notificacao.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Notificacao notificacao;
  DetailScreen({Key key, @required this.notificacao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
                height: 40,
                child: Text('Notificação', style: TextStyle(fontSize: 26))),
            Row(
              children: [
                Container(
                    height: 36,
                    child: Text('Folha de Campo N°: ${notificacao.folha}',
                        style: TextStyle(fontSize: 20))),
              ],
            ),
            Row(
              children: [
                Container(
                    height: 36,
                    child: Text('Data: ${notificacao.data}',
                        style: TextStyle(fontSize: 20))),
                Flexible(
                    child: Container(
                        width: double.infinity,
                        height: 36,
                        child: Text(
                          'Horário: ${notificacao.horario}',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.right,
                        )))
              ],
            ),
            Row(
              children: [
                Container(
                    height: 36,
                    child: Text('Endereço: ${notificacao.endereco}',
                        style: TextStyle(fontSize: 20))),
                Flexible(
                    child: Container(
                        width: double.infinity,
                        height: 36,
                        child: Text(
                          'N°: ${notificacao.numero}',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.right,
                        )))
              ],
            ),
            Row(
              children: [
                Container(
                    height: 36,
                    child: Text('Complemento: ${notificacao.complemento}',
                        style: TextStyle(fontSize: 20))),
                Flexible(
                    child: Container(
                        width: double.infinity,
                        height: 36,
                        child: Text(
                          'Bairro: ${notificacao.bairro}',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.right,
                        )))
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: Container(
                        height: 40,
                        child: Text('Município: ${notificacao.municipio}',
                            style: TextStyle(fontSize: 20)))),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: Container(
                        height: 40,
                        child: Text('Problema: ${notificacao.problema}',
                            style: TextStyle(fontSize: 20)))),
              ],
            ),
            Row(
              children: [
                Container(
                    height: 36,
                    child: Text('Fiscal: ${notificacao.fiscal}',
                        style: TextStyle(fontSize: 20))),
                Flexible(
                    child: Container(
                        height: 36,
                        width: double.infinity,
                        child: Text(
                          'Cliente: ${notificacao.cliente}',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.right,
                        )))
              ],
            ),
            Row(
              children: [
                Container(
                    height: 36,
                    child: Text('Matrícula: ${notificacao.matricula}',
                        style: TextStyle(fontSize: 20))),
                Flexible(
                    child: Container(
                        height: 36,
                        width: double.infinity,
                        child: Text(
                          'RG: ${notificacao.rg}',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.right,
                        )))
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: Container(
                        height: 36,
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text('Editar'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Cadastrar(notificacao: notificacao))
                            );
                          },
                        ))),
                Flexible(
                    child: Container(
                        height: 36,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              DatabaseProvider.db
                                  .deleteNotific(notificacao.id)
                                  .then((value) => Navigator.pop(context));
                            },
                            child: Text('Excluir')))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
