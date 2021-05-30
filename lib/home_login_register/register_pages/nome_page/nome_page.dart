import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/core/app_colors.dart';
import 'package:pequenos_empreendedores/home_login_register/register_pages/tela_sexo/sexo_page.dart';
import 'package:pequenos_empreendedores/manutencao_page/manutencao_page.dart';
import 'package:pequenos_empreendedores/home_login_register/register_pages/variaveis.dart';

class NomePage extends StatefulWidget {
  //const NomePage({Key key}) : super(key: key);

  @override
  _NomePageState createState() => _NomePageState();
}

class _NomePageState extends State<NomePage> {

  //TextEditingController txtnome = TextEditingController();

  // Para passar valores entre telas precisa de um construtor que é POO
  String _nome;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.fundoBasico,
        title: Text(
          "MEU NOME É...", style: TextStyle(
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

              Form(
                key: _formKey,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      //controller: txtnome,
                      // Ver se da certo
                      onSaved: (value) {
                        setState(() {
                          _nome = value;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: "Nome"
                      ),
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
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
                            builder: (context)  => SexoPage()
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
