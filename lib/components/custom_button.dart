import 'package:flutter/material.dart';

import '../screens/register_screen.dart';

class CustomButton extends StatelessWidget {
  final String btnName;
  final VoidCallback controller;
  final String linkName;
  final Widget redirect;

  const CustomButton({
    Key? key,
    required this.btnName,
    required this.controller,
    required this.linkName,
    required this.redirect
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            controller();
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          ),
          child: Text(
            btnName,
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(height: 20),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => redirect),
            );
          },
          child: Text(linkName),
        ),
      ],
    );
  }

}