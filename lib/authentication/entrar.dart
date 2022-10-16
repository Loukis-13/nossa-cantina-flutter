import 'package:flutter/material.dart';

class Entrar extends StatefulWidget {
  const Entrar({Key? key, required this.callback}) : super(key: key);

  final Function callback;

  @override
  State<Entrar> createState() => _EntrarState();
}

class _EntrarState extends State<Entrar> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: [
        const Text("Entrar", style: TextStyle(fontSize: 30)),
        Form(
          key: _formKey,
          child: Wrap(
            runSpacing: 20,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "E-mail"),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: "Senha"),
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
                    "REGISTRAR",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              SizedBox(
                height: 35,
                child: ElevatedButton(
                  onPressed: () => Navigator.popAndPushNamed(context, "/escola"),
                  child: const Text(
                    "ENTRAR",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
