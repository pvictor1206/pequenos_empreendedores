import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/core/app_colors.dart';
import 'package:pequenos_empreendedores/home_login_register/login_page/login_page.dart';

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
    return Scaffold(
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
                        return "E-mail Inválido!";
                      }
                    },


                  ),
                ),
                SizedBox(height: 16.0,), //Espaço
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      child: Image.asset("assets/images/tela_padrao/botao-recuperar.png"),
                      onPressed: () {
                        auth.sendPasswordResetEmail(email: _email);
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                      child: Image.asset("assets/images/tela_padrao/botao-voltar.png"),
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
    );
  }
}

/*
Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Padding(
padding: const EdgeInsets.all(8.0),
child: TextField(
keyboardType: TextInputType.emailAddress,
decoration: InputDecoration(
hintText: ("Email"),
),
onChanged: (value) {
setState(() {
_email = value;
});
},
),
),
Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: [
RaisedButton(
child: Text("Alterar Senha"),
onPressed: () {
auth.sendPasswordResetEmail(email: _email);
Navigator.of(context).pop();
},
color:  Theme.of(context).accentColor,
),
RaisedButton(
child: Text("Voltar"),
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


 */