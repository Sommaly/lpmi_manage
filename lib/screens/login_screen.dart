import 'package:flutter/material.dart';
import 'package:lpmi_manage/components/custom_button.dart';
import 'package:lpmi_manage/screens/register_screen.dart';
import '../controllers/authentification_controller.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final AuthentificationController authController =
      AuthentificationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Connexion",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              child: TextField(
                controller: authController.emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              child: TextField(
                controller: authController.passwordController,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              btnName: 'Se connecter',
              controller: () {
                authController.signInWithEmailAndPassword(
                    authController.emailController.text,
                    authController.passwordController.text,
                    context);
              },
              linkName: "Pas de compte ? S'inscrire",
              redirect: RegisterScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
