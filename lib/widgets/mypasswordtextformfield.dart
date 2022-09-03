import 'package:flutter/material.dart';

class MyPasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  MyPasswordTextFormField({ this.title,  this.controller});

  @override
  _MyPasswordTextFormFieldState createState() =>
      _MyPasswordTextFormFieldState();
}

class _MyPasswordTextFormFieldState extends State<MyPasswordTextFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: Theme.of(context).primaryColor,
      obscureText: obscureText,
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Icon(
              obscureText == true ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColor,
            ),
          ),
          fillColor: Color(0xfff5d8e4),
          filled: true,
          hintText: widget.title,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
      ),
    );
  }
}
