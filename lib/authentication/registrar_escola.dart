import 'package:flutter/material.dart';

class RegistrarEscola extends StatefulWidget {
  const RegistrarEscola({Key? key, required this.callback}) : super(key: key);

  final Function callback;

  @override
  State<RegistrarEscola> createState() => _RegistrarState();
}

class _RegistrarState extends State<RegistrarEscola> {
  var formKey = GlobalKey<FormState>();

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
              TextFormField(
                decoration: const InputDecoration(labelText: "Nome da instituição"),
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
