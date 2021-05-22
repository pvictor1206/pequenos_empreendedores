import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/home_login_register/login_page/login_page.dart';
import 'package:pequenos_empreendedores/home_login_register/register_page/register_page.dart';
import 'package:pequenos_empreendedores/core/app_colors.dart';

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
        backgroundColor: AppColors.fundoBasico,
        title: Text(
            "INICIE SUA AVENTURA", style: TextStyle(
            color: AppColors.azulFonte,
            fontSize: 25
        ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              child: FractionallySizedBox(
                heightFactor: 1.0,
                widthFactor: 1.0,
                //Colocar tela cheia
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/tela_padrao/tela.png"),
                      fit: BoxFit.fill,
                    )
                  ),
                ),
              ),
            ),
        Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50.0,), //Espaço
            Container(
              child: Image.asset("assets/images/tela_padrao/logo-menu.png"),
            ),
            SizedBox(height: 20.0,),
            Container(
              //padding: EdgeInsets.only(top: 450.0),
              child: Center(
                child: Text("Continuar \nAventura",
                  style: TextStyle(
                      color: AppColors.azulFonte,
                      fontSize: 20
                  ),
                ),
              ),
            ),
            //Editar os botoes
            Container(
              child: Center(
                child: FlatButton(
                  child: Image.asset("assets/images/tela_padrao/botao-entre-menu.png"),
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
            SizedBox(height: 16.0,), //Espaço
            Container(
              child: Center(
                child: Text("Nova Aventura",
                  style: TextStyle(
                      color: AppColors.azulFonte,
                      fontSize: 20
                  ),
                ),
              ),
            ),
            Container(
              child: Center(
                child: FlatButton(
                  child: Image.asset("assets/images/tela_padrao/botao-crie-conta-menu.png"),
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
        ),
      ]
            )
        ),
      );
  }
}