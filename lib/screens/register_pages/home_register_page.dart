import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/core/app_colors.dart';
import 'package:pequenos_empreendedores/screens/home_page/home_page.dart';
import 'package:pequenos_empreendedores/screens/manutencao_page/manutencao_page.dart';
import 'package:pequenos_empreendedores/screens/register_pages/sexo_page/sexo_page.dart';

class HomeRegisterPage extends StatefulWidget {
  //const HomePage({Key key}) : super(key: key);

  @override
  _HomeRegisterPageState createState() => _HomeRegisterPageState();
}

class _HomeRegisterPageState extends State<HomeRegisterPage> {

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
              builder: (context)  => SexoPage()
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
                "Registra-se", style: TextStyle(
                  color: AppColors.azulFonte, fontSize: 35),
              ),
              centerTitle: true,
            ),
            body: Stack(
              children: [
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
                                  return "E-mail Inválido";
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
                                  child: Image.asset("assets/images/tela_padrao/botao-crie-conta-menu.png",
                                    width: MediaQuery.of(context).size.width * 0.30,),
                                ),
                                FlatButton(
                                  child: Image.asset("assets/images/tela_padrao/botao-voltar.png",
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

                          ],
                        ),
                      )
                  ),
                )
              ],
            )
        )
      ],
    );
  }


}
