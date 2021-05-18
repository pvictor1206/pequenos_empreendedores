import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/home_login_register/landing_page/landing_page.dart';
import 'package:pequenos_empreendedores/manutencao_page/manutencao_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
    );
  }
}