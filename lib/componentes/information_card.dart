import 'package:flutter/cupertino.dart';

class InformationCard extends StatelessWidget {
final IconData iconData;
final String text;

InformationCard({required this.iconData,required this.text});

@override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData,size: 20,),
        Text(text,style: TextStyle(fontWeight: FontWeight.w300))
      ],
    );
  }
}
