import 'package:flutter/material.dart';
import 'package:nossa_cantina/controllers/auth_controller.dart';
import 'package:provider/provider.dart';

import '../providers/produtos.dart';
import 'drawer.dart';
import 'lista_itens_aluno.dart';

class Aluno extends StatefulWidget {
  const Aluno({Key? key}) : super(key: key);

  @override
  State<Aluno> createState() => _AlunoState();
}

class _AlunoState extends State<Aluno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NOSSA CANTINA"),
        centerTitle: true,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_basket),
            tooltip: "Pedidos",
            onPressed: () => Navigator.pushNamed(context, "carrinho"),
          ),
          IconButton(
            icon: const Icon(Icons.power_settings_new),
            tooltip: "Sair",
            onPressed: () => AuthController.logout(context),
          ),
        ],
      ),
      drawer: const AlunoMenu(),
      body: Column(
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.all(5),
            child: Consumer<Produtos>(
              builder: (context, value, child) => TextField(
                decoration: InputDecoration(
                  fillColor: Colors.orange,
                  filled: true,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  hintText: 'Buscar',
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (val) => value.search(val),
              ),
            ),
          ),
          const Expanded(child: ListaItensAluno()),
        ],
      ),
    );
  }
}
