import 'package:flutter/material.dart';
import 'package:nossa_cantina/controllers/auth_controller.dart';
import 'package:provider/provider.dart';

import '../providers/produtos.dart';
import 'lista_itens_escola.dart';

class Escola extends StatefulWidget {
  const Escola({Key? key}) : super(key: key);

  @override
  State<Escola> createState() => _EscolaState();
}

class _EscolaState extends State<Escola> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NOSSA CANTINA"),
        centerTitle: true,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.power_settings_new),
            tooltip: "Sair",
            onPressed: () => AuthController.logout(context),
          )
        ],
      ),
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
          const Expanded(child: ListaItensEscola()),
        ],
      ),
    );
  }
}
