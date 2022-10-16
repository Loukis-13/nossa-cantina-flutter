import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:provider/provider.dart';

import '../providers/produtos.dart';

class ListaItensAluno extends StatefulWidget {
  const ListaItensAluno({Key? key}) : super(key: key);

  @override
  State<ListaItensAluno> createState() => _ListaItensAlunoState();
}

class _ListaItensAlunoState extends State<ListaItensAluno> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Produtos>(
      builder: (context, value, child) => GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .75,
        children: [
          for (var e in value.getSearchedItems())
            Card(
              child: Column(
                children: [
                  AspectRatio(aspectRatio: 1.6, child: Image.asset(e.img, fit: BoxFit.cover)),
                  const SizedBox(height: 10),
                  Text(e.name, style: Theme.of(context).textTheme.headline6),
                  const SizedBox(height: 5),
                  Text(
                    "R\$ ${e.price.toStringAsFixed(2).replaceAll('.', ',')}",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: SpinBox(
                      value: e.qnt,
                      min: 0,
                      max: 10,
                      onChanged: (val) => value.updateItem(e, val),
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
