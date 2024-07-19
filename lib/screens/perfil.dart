import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_final/database/database.dart';
import 'package:flutter_app_final/screens/calculadora.dart';
import 'package:flutter_app_final/screens/imc.dart';

class TelaPerfil extends StatelessWidget {
  final User user;

  const TelaPerfil({super.key, required this.user});

  void logout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.nome),
        backgroundColor: const Color.fromRGBO(169, 209, 231, 8),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => logout(context),
          ),
        ],
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ElevatedButton(onPressed:() {Navigator.push(context,
              MaterialPageRoute(builder: (context) => TelaIMC()));}, child: Text('Calcule seu IMC')),
          const SizedBox(height: 100),
          ElevatedButton(onPressed:() {Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TelaCalc()));}, child: Text('Calculadora')),
          ]
          )
      );
  }
}
