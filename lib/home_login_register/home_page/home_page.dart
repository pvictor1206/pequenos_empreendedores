import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/home_login_register/login_page/login_page.dart';
import 'package:pequenos_empreendedores/home_login_register/register_page/register_page.dart';

class HomePage extends StatefulWidget {
  //const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        centerTitle: true,
      ),
      body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Editar os botoes
          Container(
            padding: EdgeInsets.only(top: 500.0),
            child: Center(
              child: RaisedButton(
                child: Text("Login"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)  => LoginPage()
                      )
                  );
                },
              ),
            ),
          ),
          Container(
            child: Center(
              child: RaisedButton(
                child: Text("Registra-se"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)  => RegisterPage()
                      )
                  );
                },
              ),
            ),
          ),
        ],
      )
    );
  }
}
