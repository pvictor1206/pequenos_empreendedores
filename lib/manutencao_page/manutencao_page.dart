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
            "ManutencaoPage", style: TextStyle(
            color: AppColors.azulFonte,
            fontFamily: "LilitaOne"),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text("EM MANUTENCAO..."),
                    ),
                    RaisedButton(
                      child: Text("Tela Inicial"),
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

/*
Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Center(
child: Text("EM MANUTENCAO..."),
),
RaisedButton(
child: Text("Tela Inicial"),
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

 */