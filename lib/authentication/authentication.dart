import 'package:flutter/material.dart';
import 'dart:math';

import 'package:nossa_cantina/authentication/entrar.dart';
import 'package:nossa_cantina/authentication/registrar_aluno.dart';
import 'package:nossa_cantina/authentication/registrar_escola.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final imagem = AssetImage("assets/fundo/${Random().nextInt(10)}.jpg");
  var isRegistrar = false;
  var isAluno = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NOSSA CANTINA"),
        centerTitle: true,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: "Sobre",
            onPressed: () => Navigator.pushNamed(context, "/sobre"),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imagem,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
                  child: Column(
                    children: [
                      if (isRegistrar)
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                    height: 70,
                                    color: isAluno ? Colors.white : Colors.grey.shade300,
                                    child: TextButton(
                                        onPressed: () => setState(() => isAluno = true),
                                        child: const Text(
                                          "ALUNO",
                                          style: TextStyle(fontSize: 17),
                                        )))),
                            Expanded(
                                child: Container(
                                    height: 70,
                                    color: !isAluno ? Colors.white : Colors.grey.shade300,
                                    child: TextButton(
                                        onPressed: () => setState(() => isAluno = false),
                                        child: const Text(
                                          "ESCOLA",
                                          style: TextStyle(fontSize: 17),
                                        ))))
                          ],
                        ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: isRegistrar
                            ? isAluno
                                ? RegistrarAluno(callback: () => setState((() => isRegistrar = false)))
                                : RegistrarEscola(callback: () => setState((() => isRegistrar = false)))
                            : Entrar(callback: () => setState((() => isRegistrar = true))),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
