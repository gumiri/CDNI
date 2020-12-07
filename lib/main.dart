import 'package:CDNI/Home.dart';
import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(MaterialApp(
    title: 'CDNI',
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();

  
}

class _Login extends State<Login> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _matriculaController = TextEditingController();
  final _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  bool verify() {
    if (_matriculaController.text == "1211" &&
        _senhaController.text == "00321") {
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
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
                  child: Column(children: [
            TextFormField(
              validator: (value){
                if (value.isEmpty){
                  return 'Campo vazio';
                }
                if (!verify()){
                  return 'Matrícula ou senha incorreta';
                }
              },
              controller: _matriculaController,
              decoration: InputDecoration(
                  hintText: "Digite a matrícula", labelText: "Matrícula"),
            ),
            TextFormField(
              validator: (value){
                if (value.isEmpty){
                  return 'Campo vazio';
                }
                if (!verify()){
                  return 'Matrícula ou senha incorreta';
                }
              },
              controller: _senhaController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Digite a senha",
                labelText: "Senha",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _formKey.currentState.validate();
                if (verify()) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                }
              },
              child: Text("Login"),
            )
            
          ]),
        ),
      )),
    );
  }
}