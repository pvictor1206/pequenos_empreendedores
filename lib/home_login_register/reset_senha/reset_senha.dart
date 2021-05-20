import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/home_login_register/login_page/login_page.dart';

class ResetSenha extends StatefulWidget {
  const ResetSenha({Key key}) : super(key: key);

  @override
  _ResetSenhaState createState() => _ResetSenhaState();
}

class _ResetSenhaState extends State<ResetSenha> {
  String _email;
  final auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Esqueci Senha"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: ("Email"),
              ),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                child: Text("Alterar Senha"),
                  onPressed: () {
                  auth.sendPasswordResetEmail(email: _email);
                  Navigator.of(context).pop();
                  },
                color:  Theme.of(context).accentColor,
              ),
              RaisedButton(
                child: Text("Voltar"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)  => LoginPage()
                      )
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
