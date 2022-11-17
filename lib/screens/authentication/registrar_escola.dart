import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:nossa_cantina/controllers/auth_controller.dart';

class RegistrarEscola extends StatefulWidget {
  const RegistrarEscola({Key? key, required this.callback}) : super(key: key);

  final Function callback;

  @override
  State<RegistrarEscola> createState() => _RegistrarState();
}

class _RegistrarState extends State<RegistrarEscola> {
  final _formKey = GlobalKey<FormState>();

  var nome = TextEditingController();
  var email = TextEditingController();
  var senha = TextEditingController();
  var senha2 = TextEditingController();

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
              TextFormField(
                controller: nome,
                decoration: const InputDecoration(labelText: "Nome da instituição"),
              ),
              TextFormField(
                controller: email,
                validator: (value) => EmailValidator.validate(value!) ? null : "E-mail invalido",
                decoration: const InputDecoration(labelText: "E-mail"),
              ),
              TextFormField(
                controller: senha,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Senha"),
              ),
              TextFormField(
                controller: senha2,
                obscureText: true,
                validator: (value) => value == senha.text ? null : "As senhas diferem",
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
                  child: const Text("ENTRAR", style: TextStyle(color: Colors.white)),
                ),
              ),
              const Expanded(child: SizedBox()),
              SizedBox(
                height: 35,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AuthController.registrarEscola(context, nome.text, email.text, senha.text);
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
