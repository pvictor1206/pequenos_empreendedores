import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/screens/home_page/home_page.dart';

class LandingPage extends StatelessWidget {
  //const LandingPage({Key key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("Error: ${snapshot.error}"),
              ),
            );
          }

          if(snapshot.connectionState == ConnectionState.done){
            return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.active) {
                  User user = snapshot.data;

                  // Usuario conectado ou desconectado
                  if(user == null) {
                    return HomePage();
                  } else {
                    return HomePage();
                  }
                }
                return Scaffold(
                  body: Center(
                    // Colocar imagem aqui
                    child: Text("Carregando Aventura..."),
                  ),
                );

              },

            );
          }

          return Scaffold(
            body: Center(
              child: Text("ENTRANDO NA JORNDADA..."),
            ),
          );

        }
    );
  }
}
