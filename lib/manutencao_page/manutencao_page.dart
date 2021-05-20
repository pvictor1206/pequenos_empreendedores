import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/home_login_register/home_page/home_page.dart';

class ManutencaoPage extends StatelessWidget {
  const ManutencaoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ManutencaoPage"),
        centerTitle: true,
      ),
      body: Column(
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
    );
  }
}
