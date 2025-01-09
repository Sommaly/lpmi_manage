import 'package:flutter/material.dart';
import 'package:lpmi_manage/screens/login_screen.dart';
import 'package:lpmi_manage/controllers/authentification_controller.dart';
import 'package:provider/provider.dart';

import '../components/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int? _selectedGender = 1;
  final AuthentificationController authController = AuthentificationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<AuthentificationController>(
          builder: (context, controller, _) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Titre
                  Text(
                    "Inscription",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Champ de saisie pour le nom
                  Container(
                    width: 300,
                    child: TextField(
                      controller: authController.firstNameController,
                      decoration: InputDecoration(
                        labelText: 'Nom',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Champ de saisie pour le prénom
                  Container(
                    width: 300,
                    child: TextField(
                      controller: authController.lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Prénom',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Champ de saisie pour l'email
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

                  // Champ de saisie pour le mot de passe
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Radio<int>(
                            value: 1,
                            groupValue: _selectedGender,
                            onChanged: (int? value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                          Text('Masculin'),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Radio<int>(
                            value: 2,
                            groupValue: _selectedGender,
                            onChanged: (int? value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                          Text('Féminin'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    btnName: 'S\'inscrire',
                    controller: () {
                      authController.createUserWithEmailAndPassword(
                          authController.emailController.text,
                          authController.passwordController.text,
                          context);
                    },
                    linkName: "Déjà un compte? Se connecter",
                    redirect: LoginScreen(),
                  ),
                ],
              ),
            );
          },
        ),
      );
  }
}
