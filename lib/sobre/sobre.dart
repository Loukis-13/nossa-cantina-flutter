import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NOSSA CANTINA"),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: const Color(0xffffab15),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Image.asset('assets/indice.png', height: 250),
            ),
            Text("Desenvolvedor", style: Theme.of(context).textTheme.headlineLarge),
            Text("jose.hypolito@fatec.sp.gov.br", style: Theme.of(context).textTheme.headline5),
            const Expanded(child: SizedBox()),
            Text("v0.0.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
      ),
    );
  }
}
