import 'package:flutter/material.dart';

class ManutencaoPage extends StatelessWidget {
  const ManutencaoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ManutencaoPage"),
      ),
      body: Center(
        child: Text("EM MANUTENCAO..."),
      ),
    );
  }
}
