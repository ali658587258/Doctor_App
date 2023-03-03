import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/app_colors.dart';

class MyButton extends StatelessWidget {

  final String text;
  final  function;


  MyButton({required this.text, required this.function});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(onPressed: function,
        child: Text(text),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.kMainColors),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),

                )
            )
        ),
      ),
    );
  }
}
