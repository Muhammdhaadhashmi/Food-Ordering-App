import 'package:flutter/material.dart';
class Toptittle extends StatelessWidget {
  final String tittle,subtittle;
    Toptittle({ this.tittle, this.subtittle});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 150,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tittle,style: TextStyle(fontSize: 40,color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold
          ),
          ),
          Text(subtittle,style: TextStyle(fontSize: 30,color: Theme.of(context).primaryColor),)
        ],
      ),
    );
  }
}
