import 'package:flutter/material.dart';

class AlunoMenu extends StatelessWidget {
  const AlunoMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade300,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/Ornacio.jpeg"),
              radius: 150,
            ),
          ),
          Center(child: Text("Ornácio", style: Theme.of(context).textTheme.headline2)),
          Center(child: Text("R\$ 20,00", style: Theme.of(context).textTheme.headline3)),
          const SizedBox(height: 50),
          Center(child: Text("Mensagens", style: Theme.of(context).textTheme.headline4)),
          Expanded(
            child: Container(
              color: Colors.grey,
              margin: const EdgeInsets.all(10),
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: const [
                  Mensagem("terça não haverá aula terça não haverá aula terça não haverá aula terça não haverá aula"),
                  Mensagem("terça não haverá aula terça não haverá aula terça não haverá aula terça não haverá aula"),
                  Mensagem("terça não haverá aula terça não haverá aula terça não haverá aula terça não haverá aula"),
                  Mensagem("terça não haverá aula terça não haverá aula terça não haverá aula terça não haverá aula"),
                  Mensagem("terça não haverá aula terça não haverá aula terça não haverá aula terça não haverá aula"),
                  Mensagem("terça não haverá aula terça não haverá aula terça não haverá aula terça não haverá aula"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Mensagem extends StatelessWidget {
  const Mensagem(this.mensagem, {Key? key}) : super(key: key);

  final String mensagem;

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.grey.shade600,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        child: Text(mensagem),
      );
}
