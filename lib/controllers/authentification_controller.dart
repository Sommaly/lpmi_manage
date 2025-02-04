import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lpmi_manage/screens/home_screen.dart';
import 'package:lpmi_manage/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../main.dart';

class AuthentificationController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> createUserWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      if(email == ''){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email obligatoire')),
        );
      }else if (password.length < 6){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Le mot de passe doit contenir au moins 6 caractères')),
        );
      } else{
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        notifyListeners();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Inscription réussie ! Connectez-vous')),
        );
      }
    } catch (e) {
      print("Erreur $e");
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      notifyListeners();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Connexion réussie !')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Les identifiants ne sont pas reconnus')),
      );
    }
  }

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IntroductionScreen()),
    );
  }



  Future<int> getUserCount() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users').get();
      return snapshot.size;
    } catch (e) {
      print("Erreur lors de la récupération du nombre d'utilisateurs: $e");
      return 0;
    }
  }

}
