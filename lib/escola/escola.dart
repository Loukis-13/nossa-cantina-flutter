import 'package:flutter/material.dart';
import 'package:nossa_cantina/escola/lista_itens_escola.dart';
import 'package:provider/provider.dart';

import '../providers/produtos.dart';

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
