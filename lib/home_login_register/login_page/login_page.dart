import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/core/app_colors.dart';
import 'package:pequenos_empreendedores/home_login_register/home_page/home_page.dart';
import 'package:pequenos_empreendedores/home_login_register/reset_senha/reset_senha.dart';
import 'package:pequenos_empreendedores/manutencao_page/manutencao_page.dart';

class LoginPage extends StatefulWidget {
  //const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth
          .instance
          .signInWithEmailAndPassword(email: _email, password: _password);
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
            "Login", style: TextStyle(
            color: AppColors.azulFonte, fontSize: 35),
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
                Form(
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
                              style: TextStyle(fontSize: 25),
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
                              style: TextStyle(fontSize: 25),
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
                            Align(
                              alignment: Alignment.centerRight,
                              child: FlatButton(
                                child: Text("Esqueci Senha", style: TextStyle(fontSize: 18),),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context)  => ResetSenha()
                                      )
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 16.0,), //Espaço
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlatButton(
                                  onPressed: () {
                                    if(_formKey.currentState.validate()){
                                      _login();
                                    }
                                  },
                                  child: Image.asset("assets/images/tela_padrao/botao-entrar.png"),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context)  => HomePage()
                                        ),
                                    );
                                  },
                                  child: Image.asset("assets/images/tela_padrao/botao-voltar.png"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                  ),
                )
              ]
          )
      ),
    );
  }
}

/*
Form(
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      child: Text("Esqueci Senha"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)  => ResetSenha()
                            )
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16.0,), //Espaço
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          if(_formKey.currentState.validate()){
                            _login();
                          }
                        },
                        child: Text("Login"),
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
                  ),
                ],
              ),
            )
        ),
      )
 */