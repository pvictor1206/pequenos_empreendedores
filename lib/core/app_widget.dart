import 'package:flutter/material.dart';
import 'package:pequenos_empreendedores/core/app_colors.dart';
import 'package:flutter/services.dart';
import 'package:pequenos_empreendedores/screens/landing_page/landing_page.dart';
import 'package:pequenos_empreendedores/screens/login_page/login_page.dart';
import 'package:pequenos_empreendedores/screens/register_pages/nome_page/nome_page.dart';

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