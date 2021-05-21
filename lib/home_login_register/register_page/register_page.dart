import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/core/app_colors.dart';
import 'package:pequenos_empreendedores/home_login_register/home_page/home_page.dart';
import 'package:pequenos_empreendedores/manutencao_page/manutencao_page.dart';

class RegisterPage extends StatefulWidget {
  //const HomePage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  Future<void> _createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth
          .instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
      print("User: $userCredential");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context)  => ManutencaoPage()
          )
      );
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
    } catch (e) {
      print("Error: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.fundoBasico,
        title: Text(
            "Registra-se", style: TextStyle(
        color: AppColors.azulFonte,
            fontFamily: "LilitaOne"),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    onChanged: (value) {
                      _email = value;
                    },
                    decoration: InputDecoration(
                        hintText: "Email"
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text){
                      if(text.isEmpty || !text.contains("@")){
                        return "E-mail Inválido!";
                      }
                    },
                  ),
                  TextFormField(
                    onChanged: (value) {
                      _password = value;
                    },
                    decoration: InputDecoration(
                        hintText: "Senha"
                    ),
                    obscureText: true,
                    validator: (text) {
                      if(text.isEmpty){
                        return "Senha Inválida";
                      }
                      else if(text.length <6){
                        return "Senha menor que 6 caracteres!";
                      }
                    },
                  ),
                  SizedBox(height: 16.0,), //Espaço
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          if(_formKey.currentState.validate()){
                            _createUser();
                          }
                        },
                        child: Text("Criar nova conta"),
                      ),
                      RaisedButton(
                        child: Text("Voltar"),
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

                ],
              ),
            )
        ),
      )
    );
  }


}
