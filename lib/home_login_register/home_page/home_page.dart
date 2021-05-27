import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/home_login_register/login_page/login_page.dart';
import 'package:pequenos_empreendedores/home_login_register/register_page/register_page.dart';
import 'package:pequenos_empreendedores/core/app_colors.dart';
import 'package:pequenos_empreendedores/home_login_register/register_pages/home_register_page.dart';
import 'package:pequenos_empreendedores/home_login_register/register_pages/tela_sexo/sexo_page.dart';

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
              //width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height,
              child: FractionallySizedBox(
                heightFactor: 1.0,
                widthFactor: 1.0,
                //Colocar tela cheia
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/tela_padrao/tela.png",),
                      fit: BoxFit.fill,
                    )
                  ),
                ),
              ),
            ),
        Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.width * 0.10,), //Espaço
            Container(
              child: Image.asset("assets/images/tela_padrao/logo-menu.png",
                width: MediaQuery.of(context).size.width * 0.70,),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.01,), //Espaço
            Container(
              //padding: EdgeInsets.only(top: 450.0),
              child: Center(
                child: Text("Continuar \nAventura",
                  style: TextStyle(
                      color: AppColors.azulFonte,
                      fontSize: 17
                  ),
                ),
              ),
            ),
            //Editar os botoes
            Container(
              child: Center(
                child: FlatButton(
                  child: Image.asset("assets/images/tela_padrao/botao-entre-menu.png",
                      width: MediaQuery.of(context).size.width * 0.30,),
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
            SizedBox(height: MediaQuery.of(context).size.width * 0.01,), //Espaço
            Container(
              child: Center(
                child: Text("Nova Aventura",
                  style: TextStyle(
                      color: AppColors.azulFonte,
                      fontSize: 17
                  ),
                ),
              ),
            ),
            Container(
              child: Center(
                child: FlatButton(
                  child: Image.asset("assets/images/tela_padrao/botao-crie-conta-menu.png",
                    width: MediaQuery.of(context).size.width * 0.30,),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)  => HomeRegisterPage()
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