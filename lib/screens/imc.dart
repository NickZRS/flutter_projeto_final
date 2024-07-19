import 'package:flutter/material.dart';
import 'dart:math';



class TelaIMC extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<TelaIMC> {
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();
  Color corDeFundo = Colors.white;

  String mensagem = '';

  void calculaIMC() {
    setState(() {
      double peso = double.tryParse(pesoController.text) ?? 0;
      double altura = (double.tryParse(alturaController.text) ?? 0) / 100;
      double imc = peso / pow(altura, 2);
      String imcForm = imc.toStringAsFixed(2);

      
      

      if (imc <= 18.5) {
        mensagem = 'Seu IMC é igual a $imcForm = Magreza';
        corDeFundo = Colors.red;
      }else if(imc >= 18.6 && imc <= 24.9){
        mensagem = 'seu IMC é igual a $imcForm = Normal';
        corDeFundo = Colors.green;
      }else if(imc >= 25.0 && imc <= 29.9){
        mensagem = 'seu IMC é igual a $imcForm = Sobrepeso';
        corDeFundo = Color.fromRGBO(255, 180, 180, 1);
      }else if(imc >= 30.0 && imc <= 34.9){
        mensagem = 'seu IMC é igual a $imcForm = Obesidade grau I';
        corDeFundo = Color.fromRGBO(255, 240, 136, 1);
      }else if(imc >= 35.0 && imc <= 39.9){
        mensagem = 'seu IMC é igual a $imcForm = Obesidade grau II';
        corDeFundo = Color.fromRGBO(255, 255, 89, 1);
      }else if(imc > 39.9){
        mensagem = 'seu IMC é igual a $imcForm = Obesidade grau III';
        corDeFundo = Color.fromRGBO(178, 34, 34, 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corDeFundo,
      appBar: AppBar(
        title: Text('IMC - Índice de Massa Corporal'),
        backgroundColor: corDeFundo,
      ),
      body: Padding(
        
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: pesoController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite seu peso:',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Digite sua altura(em centímetros):'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(),
              onPressed: calculaIMC,
              child: Text('Calcular'),
            ),
            SizedBox(height: 2),
            Text(
              mensagem,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
