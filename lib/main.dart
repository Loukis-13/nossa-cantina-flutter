import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nossa_cantina/escola/escola.dart';
import 'package:provider/provider.dart';

import 'providers/produtos.dart';
import 'providers/token.dart';
import 'aluno/aluno.dart';
import 'authentication/authentication.dart';
import 'aluno/carrinho.dart';
import 'sobre/sobre.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Token()),
        ChangeNotifierProvider(create: (_) => Produtos()),
      ],
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nossa Cantina',
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xffffab00, {
          50: Color.fromRGBO(255, 255, 171, .1),
          100: Color.fromRGBO(255, 255, 171, .2),
          200: Color.fromRGBO(255, 255, 171, .3),
          300: Color.fromRGBO(255, 255, 171, .4),
          400: Color.fromRGBO(255, 255, 171, .5),
          500: Color.fromRGBO(255, 255, 171, .6),
          600: Color.fromRGBO(255, 255, 171, .7),
          700: Color.fromRGBO(255, 255, 171, .8),
          800: Color.fromRGBO(255, 255, 171, .9),
          900: Color.fromRGBO(255, 255, 171, 1)
        }),
        textTheme: GoogleFonts.ubuntuTextTheme(),
      ),
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => const Authentication(),
        '/aluno': (context) => const Aluno(),
        '/carrinho': (context) => const Carrinho(),
        '/escola': (context) => const Escola(),
        '/sobre': (context) => const Sobre(),
      },
    );
  }
}
