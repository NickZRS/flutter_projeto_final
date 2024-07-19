import 'package:flutter/material.dart';
import 'package:flutter_app_final/screens/tela_cadastro.dart';
import 'package:flutter_app_final/screens/tela_login.dart';

class TelaCalc extends StatelessWidget {
  const TelaCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Inicial'),
        backgroundColor: const Color.fromRGBO(168, 209, 231, 8),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Beatriz Vitória Matos Da Silva - 5º Semestre',
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'Nicolas Oliveira Ribeiro Dos Santos - 5º Semestre',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 50),
            const Text(
              'Prova final da disciplina Tópicos Especiais em Informática',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaLogin()),
                );
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaCadastro()),
                );
              },
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
