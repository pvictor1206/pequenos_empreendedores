import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/core/app_colors.dart';
import 'package:pequenos_empreendedores/home_login_register/home_page/home_page.dart';
import 'package:pequenos_empreendedores/home_login_register/register_pages/tela_sexo/sexo_page.dart';

class HomeRegisterPage extends StatelessWidget {
  const HomeRegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.fundoBasico,
        title: Text(
          "HomeRegister", style: TextStyle(
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

                    SizedBox(height: MediaQuery.of(context).size.width * 0.05,),

                    Container(
                      child: Text("INICIAR \nAVENTURA",
                        style: TextStyle(
                            color: AppColors.azulFonte,
                            fontSize: 35
                        ),),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.width * 0.85,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context)  => HomePage()
                              ),
                            );
                          },
                          child: Image.asset("assets/images/tela_padrao/botao-voltar.png",
                            width: MediaQuery.of(context).size.width * 0.30,),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context)  => SexoPage()
                              ),
                            );
                          },
                          child: Image.asset("assets/images/tela_padrao/botao-continuar.png",
                            width: MediaQuery.of(context).size.width * 0.30,),
                        ),
                      ],
                    ),
                  ],
                )
              ]
          )
      ),
    );
  }
}
