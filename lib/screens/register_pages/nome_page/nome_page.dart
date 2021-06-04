import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/core/app_colors.dart';
import 'package:pequenos_empreendedores/screens/register_pages/idade_page/idade_page.dart';
import 'package:pequenos_empreendedores/screens/register_pages/sexo_page/sexo_page.dart';

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
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/tela_padrao/tela.png"),
                  fit: BoxFit.cover
              )
          ),
        ),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.width * 0.05,), //Espaço

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
                          validator: (text){
                            if(text.isEmpty){
                              return "Digite um nome";
                            }
                          },
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
                          if(_formKey.currentState.validate()){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context)  => IdadePage()
                              ),
                            );
                          }
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
        )
      ],
    );
  }
}
