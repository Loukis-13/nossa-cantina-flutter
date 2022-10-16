import 'package:flutter/material.dart';

class RegistrarAluno extends StatefulWidget {
  const RegistrarAluno({Key? key, required this.callback}) : super(key: key);

  final Function callback;

  @override
  State<RegistrarAluno> createState() => _RegistrarState();
}

class _RegistrarState extends State<RegistrarAluno> {
  var formKey = GlobalKey<FormState>();
  String periodo = "Manhã";
  String escola = "FATEC";

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: [
        const Text("Registrar", style: TextStyle(fontSize: 30)),
        Form(
          key: formKey,
          child: Wrap(
            runSpacing: 20,
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Escola"),
                value: escola,
                onChanged: (value) => setState(() => escola = value!),
                items: ["FATEC", "ETEC"]
                    .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(value: value, child: Text(value)))
                    .toList(),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Periodo"),
                value: periodo,
                onChanged: (value) => setState(() => periodo = value!),
                items: ["Manhã", "Tarde", "Noite"]
                    .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(value: value, child: Text(value)))
                    .toList(),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Nome"),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "E-mail"),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: "Senha"),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: "Confirmar senha"),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: Row(
            children: [
              SizedBox(
                height: 35,
                child: ElevatedButton(
                    onPressed: () => widget.callback(),
                    child: const Text(
                      "ENTRAR",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const Expanded(child: SizedBox()),
              SizedBox(
                height: 35,
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "REGISTRAR",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }
}
