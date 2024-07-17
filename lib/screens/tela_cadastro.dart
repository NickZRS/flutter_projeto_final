
import 'package:flutter_app_final/database/database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  registerScreenState createState() => registerScreenState();

  }

  class registerScreenState extends State<TelaCadastro> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final databaseHelper = DatabaseHelper();

  void register() async {
    if (formKey.currentState!.validate()) {
      await databaseHelper.insertUser(
        emailController.text,
        passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário registrado com sucesso')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de Cadastro'),
        backgroundColor:
            const Color.fromRGBO(169, 209, 231, 8), // Cor diferente na navbar
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor digite o seu e-mail';
                          } else if (!RegExp(
                                  r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}')
                              .hasMatch(value)) {
                            return 'Por favor digite um endereço de e-mail válido';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, digite sua senha';
                          } else if (value.length < 6) {
                            return 'A senha deve ter pelo menos 6 caracteres';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const SizedBox(
                            width:
                                20), //configuração para espaçamento usando .center
                        ElevatedButton(
                          onPressed: register,
                          child: const Text('Cadastrar'),
                        ),
                        const SizedBox(
                            width:
                                20), //configuração para espaçamento usando .center
                        
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


