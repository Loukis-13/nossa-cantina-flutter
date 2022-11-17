import 'package:flutter/material.dart';
import 'package:nossa_cantina/controllers/auth_controller.dart';

class RegistrarAluno extends StatefulWidget {
  const RegistrarAluno({Key? key, required this.callback}) : super(key: key);

  final Function callback;

  @override
  State<RegistrarAluno> createState() => _RegistrarState();
}

class _RegistrarState extends State<RegistrarAluno> {
  final _formKey = GlobalKey<FormState>();

  var nome = TextEditingController();
  var email = TextEditingController();
  var senha = TextEditingController();
  var senha2 = TextEditingController();
  String periodo = "Manhã";
  String escola = "";

  Map<String, dynamic> listaEscolas = {};

  @override
  void initState() {
    super.initState();
    AuthController.getEscolas().then((value) {
      setState(() => listaEscolas = value);
      setState(() => escola = listaEscolas.keys.first);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: [
        const Text("Registrar", style: TextStyle(fontSize: 30)),
        Form(
          key: _formKey,
          child: Wrap(
            runSpacing: 20,
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Escola"),
                value: escola,
                onChanged: (value) => setState(() => escola = value!),
                items: listaEscolas.keys
                    .map((value) => DropdownMenuItem<String>(value: value, child: Text(value)))
                    .toList(),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Periodo"),
                value: periodo,
                onChanged: (value) => setState(() => periodo = value!),
                items: ["Manhã", "Tarde", "Noite"]
                    .map((String value) => DropdownMenuItem<String>(value: value, child: Text(value)))
                    .toList(),
              ),
              TextFormField(controller: nome, decoration: const InputDecoration(labelText: "Nome")),
              TextFormField(controller: email, decoration: const InputDecoration(labelText: "E-mail")),
              TextFormField(
                controller: senha,
                decoration: const InputDecoration(labelText: "Senha"),
                obscureText: true,
              ),
              TextFormField(
                controller: senha2,
                decoration: const InputDecoration(labelText: "Confirmar senha"),
                validator: (value) => value == senha.text ? null : "As senhas diferem",
                obscureText: true,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 35,
                child: ElevatedButton(
                  onPressed: () => widget.callback(),
                  child: const Text("ENTRAR", style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 35,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AuthController.registrarAluno(context, nome.text, listaEscolas[escola], periodo, email.text, senha.text);
                    }
                  },
                  child: const Text("REGISTRAR", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
