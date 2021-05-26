import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/core/app_colors.dart';
import 'package:pequenos_empreendedores/home_login_register/home_page/home_page.dart';

class ManutencaoPage extends StatelessWidget {
  const ManutencaoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.fundoBasico,
        title: Text(
            "AVISO", style: TextStyle(
            color: AppColors.azulFonte,
            fontSize: 40
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
                    SizedBox(height: 40.0,), //Espaço
                    Container(
                      child: Text("Estamos em \nManutenção",
                        style: TextStyle(
                    color: AppColors.azulFonte,
                    fontSize: 45
                ),),
                    ),
                    SizedBox(height: 20.0,), //Espaço
                    Center(
                      child: Container(
                        child: Image.asset("assets/images/tela_padrao/imagem-manutencao.png"),
                      ),
                    ),
                    FlatButton(
                      child: Image.asset("assets/images/tela_padrao/botao-manutencao.png",
                        width: MediaQuery.of(context).size.width * 0.30,),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)  => HomePage()
                            )
                        );
                      },
                    ),
                  ],
                )
              ]
          )
      ),
    );
  }
}