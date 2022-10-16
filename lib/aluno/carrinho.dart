import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:provider/provider.dart';

import '../providers/produtos.dart';

class Carrinho extends StatefulWidget {
  const Carrinho({Key? key}) : super(key: key);

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PEDIDOS"),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Consumer<Produtos>(
        builder: (context, value, child) {
          if (value.isEmpty()) {
            return ListView(
              children: [
                for (var e in value.getSelectedItems())
                  Dismissible(
                    key: ValueKey(e),
                    child: Card(
                      child: ListTile(
                        leading: AspectRatio(aspectRatio: 1, child: Image.asset(e.img, fit: BoxFit.cover)),
                        title: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    e.name,
                                    style: Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(
                                    "R\$ ${e.price.toStringAsFixed(2).replaceAll('.', ',')}",
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              child: SpinBox(
                                value: e.qnt,
                                min: 0,
                                max: 10,
                                iconSize: 20,
                                spacing: 0,
                                onChanged: (val) => value.updateItem(e, val),
                              ),
                            ),
                          ],
                        ),
                        trailing: SizedBox(
                          width: 55,
                          child: Text(
                            "R\$ ${(e.price * e.qnt).toStringAsFixed(2).replaceAll('.', ',')}",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Text(
                        "R\$ ${value.getTotal().toStringAsFixed(2).replaceAll('.', ',')}",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const Expanded(child: SizedBox()),
                      SizedBox(
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("PAGAR", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          } else {
            return Text(
              "Nenhum item selecionado",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            );
          }
        },
      ),
    );
  }
}
