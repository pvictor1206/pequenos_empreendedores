import 'package:firebase_auth/firebase_auth.dart';
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
            "HomePage", style: TextStyle(color: AppColors.azulFonte),
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
            DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/tela.png"), fit: BoxFit.cover),
                )
            ),
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
        ),
      ]
            )
        ),
      );
  }
}

/*
Column(
//mainAxisAlignment: MainAxisAlignment.center,
children: [
DecoratedBox(
decoration: BoxDecoration(
image: DecorationImage(image: AssetImage("assets/images/tela.png"), fit: BoxFit.cover),
)
),
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

 */