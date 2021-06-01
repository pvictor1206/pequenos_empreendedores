import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/core/app_colors.dart';
import 'package:pequenos_empreendedores/home_login_register/landing_page/landing_page.dart';
import 'package:pequenos_empreendedores/home_login_register/register_pages/idade_page/idade_page.dart';
import 'package:pequenos_empreendedores/manutencao_page/manutencao_page.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "LilitaOne",
        primaryColor: AppColors.azulFonte,
        backgroundColor: AppColors.fundoBasico
      ),
      home: LandingPage(),
    );
  }
}