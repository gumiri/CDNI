import 'package:CDNI/CadastrarUsuario.dart';
import 'package:CDNI/Usuario.dart';
import 'package:flutter/material.dart';
import 'DatabaseProvider.dart';

class AgenteDetail extends StatelessWidget {
  final Usuario usuario;
  AgenteDetail({Key key, @required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhe'),
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
                    child: Text('Matrícula: ${usuario.matricula}',
                        style: TextStyle(fontSize: 20))),
              ],
            ),
            Row(
              children: [
                Container(
                    height: 36,
                    child: Text('Nome: ${usuario.nome}',
                        style: TextStyle(fontSize: 20))),
                Flexible(
                    child: Container(
                        width: double.infinity,
                        height: 36,
                        child: Text(
                          'RG: ${usuario.rg}',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.right,
                        )))
              ],
            ),
            Row(children: [
              Container(
                  height: 36,
                  child: Text('Endereço: ${usuario.endereco}',
                      style: TextStyle(fontSize: 20))),
            ]),
            Row(
              children: [
                Flexible(child: Container(
                    height: 36,
                    width: double.infinity,
                    child:
                        ElevatedButton(onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CadastrarUsuario(usuario: usuario))
                            );
                          }, child: Text('Editar')))),
                Flexible(
                    child: Container(
                        height: 36,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: (){
                              DatabaseProvider.db.deleteUser(usuario.id).then((value) => Navigator.pop(context));
                              
                            
                            }, child: Text('Excluir')))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
