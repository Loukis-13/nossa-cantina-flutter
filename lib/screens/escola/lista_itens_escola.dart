import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nossa_cantina/models/item.dart';
import 'package:provider/provider.dart';

import '../providers/produtos.dart';

class ListaItensEscola extends StatefulWidget {
  const ListaItensEscola({Key? key}) : super(key: key);

  @override
  State<ListaItensEscola> createState() => _ListaItensEscolaState();
}

class _ListaItensEscolaState extends State<ListaItensEscola> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Produtos>(
      builder: (context, value, child) => GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .92,
        children: [
          for (var e in value.getSearchedItems())
            Stack(
              children: [
                Card(
                  child: Column(
                    children: [
                      AspectRatio(aspectRatio: 1.6, child: Image.asset(e.img, fit: BoxFit.cover)),
                      const SizedBox(height: 10),
                      Text(e.name, style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "R\$ ${e.price.toStringAsFixed(2).replaceAll('.', ',')}",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Text(
                              "${e.stock} qnt.",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -11,
                  right: -1,
                  width: 35,
                  child: FloatingActionButton(
                    backgroundColor: Colors.grey,
                    onPressed: () => editarItem(context, value, e),
                    child: const Icon(Icons.edit, size: 25),
                  ),
                ),
              ],
            ),
          Card(
            child: Material(
              color: Colors.grey,
              child: InkWell(
                onTap: () => editarItem(context, value, null),
                child: const Icon(Icons.add, size: 50),
              ),
            ),
          )
        ],
      ),
    );
  }

  editarItem(context, Produtos value, Item? item) {
    item ??= Item("", "", "assets/indice.jpeg", 0, 0);
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(item!.img, fit: BoxFit.cover),
                TextFormField(
                  decoration: const InputDecoration(label: Text("Nome")),
                  initialValue: item.name,
                  onSaved: (val) => item!.name = val!,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .3,
                      child: TextFormField(
                        decoration: const InputDecoration(label: Text("Preço")),
                        initialValue: "R\$ ${item.price.toStringAsFixed(2).replaceAll('.', ',')}",
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          CurrencyInputFormatter(),
                        ],
                        onSaved: (val) => item!.price = num.parse(val!.split(" ")[1].replaceAll(",", ".")).toDouble(),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .3,
                      child: TextFormField(
                        decoration: const InputDecoration(label: Text("Quantidade")),
                        initialValue: item.stock.toString(),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        onSaved: (val) => item!.stock = num.parse(val!).toInt(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                formKey.currentState!.save();
                
                // value.createItem(context, item!);
                if (item?.id == "") {
                  value.createItem(context, item!);
                } else {
                  value.updateItem(context, item!);
                }

                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String newText = "R\$ ${(double.parse(newValue.text) / 100).toStringAsFixed(2).replaceAll('.', ',')}";
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
