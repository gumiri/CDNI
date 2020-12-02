import 'package:flutter/material.dart';
import 'main.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();

  
}

class _Login extends State<Login> {
  bool login = false;
  final _matriculaController = TextEditingController();
  final _senhaController = TextEditingController();
  @override
  void initState() {
    super.initState();
    //Login().login = false;
  }

  bool verify() {
    if (_matriculaController.text == "1211" &&
        _senhaController.text == "00321") {
        // TODO: implement setState
      login = true;
      main();
      print(login);
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Notificação"),
      ),
      body: Center(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          TextFormField(
            controller: _matriculaController,
            decoration: InputDecoration(
                hintText: "Digite a matrícula", labelText: "Matrícula"),
          ),
          TextFormField(
            controller: _senhaController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Digite a senha",
              labelText: "Senha",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              verify();
              //if (verify()) {
              //Navigator.push(
              //context,
              //MaterialPageRoute(builder: (context) => (MainPage())),
              //);
              //}
            },
            child: Text("Login"),
          )
        ]),
      )),
    );
  }
}
