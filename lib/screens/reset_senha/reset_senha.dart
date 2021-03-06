import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/core/app_colors.dart';
import 'package:pequenos_empreendedores/screens/login_page/login_page.dart';

class ResetSenha extends StatefulWidget {
  const ResetSenha({Key key}) : super(key: key);

  @override
  _ResetSenhaState createState() => _ResetSenhaState();
}

class _ResetSenhaState extends State<ResetSenha> {

  final _formKey = GlobalKey<FormState>();

  String _email;
  final auth = FirebaseAuth.instance;


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
              "Esqueci Senha", style: TextStyle(
                color: AppColors.azulFonte, fontSize: 35),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
              child: Stack(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: ("Email"),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _email = value;
                                });
                              },
                              style: TextStyle(fontSize: 25),
                              validator: (text){
                                if(text.isEmpty || !text.contains("@")){
                                  return "E-mail Inv??lido!";
                                }
                              },


                            ),
                          ),
                          SizedBox(height: 16.0,), //Espa??o
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlatButton(
                                child: Image.asset("assets/images/tela_padrao/botao-recuperar.png",
                                  width: MediaQuery.of(context).size.width * 0.30,),
                                onPressed: () {
                                  auth.sendPasswordResetEmail(email: _email);
                                  Navigator.of(context).pop();
                                },
                              ),
                              FlatButton(
                                child: Image.asset("assets/images/tela_padrao/botao-voltar.png",
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
                            ],
                          ),
                        ],
                      ),

                    )
                  ]
              )
          ),
        )
      ],
    );
  }
}

