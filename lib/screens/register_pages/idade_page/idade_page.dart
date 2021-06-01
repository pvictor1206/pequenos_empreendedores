import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/core/app_colors.dart';
import 'package:pequenos_empreendedores/screens/home_page/home_page.dart';
import 'package:pequenos_empreendedores/screens/manutencao_page/manutencao_page.dart';
import 'package:pequenos_empreendedores/screens/register_pages/nome_page/nome_page.dart';

class IdadePage extends StatefulWidget {
  const IdadePage({Key key}) : super(key: key);

  @override
  _IdadePageState createState() => _IdadePageState();
}

class _IdadePageState extends State<IdadePage> {

  int _idade = 8;

  /*
  As funcoes de Somar e diminuir idade estão bugadas
   */

  void _somaIdade(){
    if(_idade >= 8 && 15 >= _idade){
      setState(() {
        _idade += 1;
      });
    }
  }

  void _diminuirIdade(){
    if(_idade >= 8 && 15 >= _idade){
      setState(() {
        _idade -= 1;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.fundoBasico,
        title: Text(
          "EU TENHO...", style: TextStyle(
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

              Container(
                child: Center(
                  child: Container(
                    child: Image.asset("assets/images/tela_registro/idade-menino.png",
                      width: MediaQuery.of(context).size.width * 0.75,),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                      onPressed: (){
                        setState(() {
                          _idade -= 1;
                        });
                      },
                      child: Image.asset("assets/images/tela_padrao/botao-diminuir.png",),
                  ),

                  Text("$_idade", style: TextStyle(fontSize: 20, color: AppColors.azulFonte),),

                  FlatButton(
                    onPressed: (){
                      setState(() {
                        _idade += 1;
                      });
                    },
                    child: Image.asset("assets/images/tela_padrao/botao-aumentar.png"),
                  ),

                  Text("ANOS",style: TextStyle(fontSize: 25, color: AppColors.azulFonte),),

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
                    child: Image.asset("assets/images/tela_padrao/botao-voltar.png",
                      width: MediaQuery.of(context).size.width * 0.30,),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)  => ManutencaoPage()
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
