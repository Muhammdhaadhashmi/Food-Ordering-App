import 'package:flutter/material.dart';
class HaveAccountornot extends StatelessWidget {
   String tittle;
   String subtittle;
   final VoidCallback onTap;
   HaveAccountornot({ this.tittle, this.subtittle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(tittle,style: TextStyle(color: Colors.black,fontSize: 15),
        ),
        SizedBox(width: 3,),
        GestureDetector(
          onTap: onTap,
          child: Text(subtittle,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20,
          ),
          ),
        ),
      ],
    );
  }
}
