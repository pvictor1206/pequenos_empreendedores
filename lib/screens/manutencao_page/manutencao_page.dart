import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/core/app_colors.dart';
import 'package:pequenos_empreendedores/screens/home_page/home_page.dart';

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
                Positioned(
                  top: 0.0,
                  child: Image.asset(
                    'assets/images/tela_padrao/tela.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(height: MediaQuery.of(context).size.width * 0.05,),

                    Container(
                      child: Text("Estamos em \nManutenção",
                        style: TextStyle(
                    color: AppColors.azulFonte,
                    fontSize: 45
                ),),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.width * 0.05,),

                    Center(
                      child: Container(
                        child: Image.asset("assets/images/tela_padrao/imagem-manutencao.png",
                          width: MediaQuery.of(context).size.width * 0.70,),
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