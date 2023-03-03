import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextEditingController controller;


  MyTextField({required this.label ,required this.controller ,this.isPassword=false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        label: Text(label)
      ),
      onFieldSubmitted: (value){},
      obscureText: isPassword,
      controller: controller,
    );
  }
}
