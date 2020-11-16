import 'package:CDNI/Notificacao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Visualisar extends StatefulWidget {
  @override
  _Visualisar createState() => _Visualisar();
}

class _Visualisar extends State<Visualisar> {
  NotificacaoHelper helper = NotificacaoHelper();
  List<Notificacao> notificacoes = List();

  @override
  void initState() {
    super.initState();
    _getAllNotificacao();
    print(notificacoes.length);
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Visualizar Notificações"),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: notificacoes.length,
          itemBuilder: (BuildContext context, int index) {
            return _notificacaoCard(context, index);
          },
        ),
      );
    }

  Widget _notificacaoCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notificacoes[index].folha ?? "",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      notificacoes[index].data ?? "",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      notificacoes[index].endereco ?? "",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
    void _getAllNotificacao() {
    helper.getAllNotificacao().then((list) {
      setState(() {
        notificacoes = list;
      });
    });
  }
}
