import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/screens/register_pages/nome_page/nome_page.dart';

import '../../../core/app_colors.dart';
import '../../home_page/home_page.dart';
import '../home_register_page.dart';

class SexoPage extends StatefulWidget {
  const SexoPage({Key key}) : super(key: key);

  @override
  _SexoPageState createState() => _SexoPageState();
}

class _SexoPageState extends State<SexoPage> {

  bool _sexoMenino = true;
  bool _sexoMenina = false;

  void _escolhaSexoMenino(){
    setState(() {
      _sexoMenino = true;
      _sexoMenina = false;
    });
  }

  void _escolhaSexoMenina(){
    setState(() {
      _sexoMenino = false;
      _sexoMenina = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.fundoBasico,
        title: Text(
          "EU SOU...", style: TextStyle(
            color: AppColors.azulFonte, fontSize: 35),
        ),
        centerTitle: true,
      ),
      body: Stack(
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
            children: [
              SizedBox(height: MediaQuery.of(context).size.width * 0.05,), //Espaço

              if(_sexoMenino == true)
                Container(
                  child: Center(
                    child: Container(
                      child: Image.asset("assets/images/tela_registro/opcao-menino.png",
                        width: MediaQuery.of(context).size.width * 0.65,),
                    ),
                  ),
                ),
              if(_sexoMenina == true)
                Container(
                  child: Center(
                    child: Container(
                      child: Image.asset("assets/images/tela_registro/opcao-menina.png",
                        width: MediaQuery.of(context).size.width * 0.75,),
                    ),
                  ),
                ),

              SizedBox(height: MediaQuery.of(context).size.width * 0.05,), //Espaço

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                      onPressed: _escolhaSexoMenino,
                      child: Image.asset("assets/images/tela_registro/escolha-menino.png",
                        width: MediaQuery.of(context).size.width * 0.28,
                      )
                  ),
                  FlatButton(
                      onPressed: _escolhaSexoMenina,
                      child: Image.asset("assets/images/tela_registro/escolha-menina.png",
                        width: MediaQuery.of(context).size.width * 0.30,
                      )
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.1,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)  => NomePage()
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
        ],
      ),
    );
  }
}
