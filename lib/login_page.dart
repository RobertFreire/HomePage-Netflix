import 'dart:async';
import 'dart:async';

import 'package:flutter/material.dart';

import 'cadastro_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    String email = "";
    String senha = "";
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextField(
                onChanged: (value) => email = value,
                decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                    hintText: 'example@gmail.com'),
              ),
              const SizedBox(height: 10),
              TextField(
                onChanged: (value) => senha = value,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'Senha', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (email == 'robert@gmail.com' && senha == '1234') {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        } else {
                          DialogBuilder(context);
                        }
                      },
                      child: const Text('Acessar')),
                  const SizedBox(width: 5),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CadastroPage()));
                      },
                      child: const Text('Cadastrar'))
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> DialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Cadastro Invalido'),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: Text('OK'))
              ],
            ));
  }
}
