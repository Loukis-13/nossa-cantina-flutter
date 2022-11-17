import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController {
  static Map user = {};

  static void registrarEscola(BuildContext context, String nome, String email, String senha) {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: senha).then((res) {
      FirebaseFirestore.instance.collection('usuarios').add({
        "uid": res.user!.uid.toString(),
        "éEscola": true,
        "nome": nome,
      }).then((value) {
        user = {"uid": value.id, "nome": nome};
        login(context, email, senha);
      });
    });
  }

  static void registrarAluno(
      BuildContext context, String nome, String escola, String periodo, String email, String senha) {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: senha).then((res) {
      FirebaseFirestore.instance.collection('usuarios').add({
        "uid": res.user!.uid.toString(),
        "éEscola": false,
        "nome": nome,
        "escola": escola,
        "periodo": periodo,
      }).then((value) {
        user = {"uid": value.id, "nome": nome, "escola": escola, "periodo": periodo};
        login(context, email, senha);
      });
    });
  }

  static void login(BuildContext context, String email, String senha) {
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: senha).then((res) {
      FirebaseFirestore.instance
          .collection('usuarios')
          .where('uid', isEqualTo: res.user!.uid.toString())
          .get()
          .then((value) {
        user = value.docs[0].data();

        if (user['éEscola']) {
          Navigator.popAndPushNamed(context, "escola");
        } else {
          Navigator.popAndPushNamed(context, "aluno");
        }
      });
    });
  }

  static void logout(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(context, 'auth', (route) => false);
  }

  static Future<Map<String, String>> getEscolas() async {
    return await FirebaseFirestore.instance
        .collection('usuarios')
        .where('éEscola', isEqualTo: true)
        .get()
        .then((value) => {for (var e in value.docs) e.data()['nome'] as String: e.data()['uid'] as String});
  }
}
