import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodorderingapp/screens/home_page.dart';
import 'package:foodorderingapp/screens/login.dart';
import 'package:foodorderingapp/widgets/haveaccount_or%20not.dart';
import 'package:foodorderingapp/widgets/myTextFormField.dart';
import 'package:foodorderingapp/widgets/mybutton.dart';
import 'package:foodorderingapp/widgets/mypasswordtextformfield.dart';
import 'package:foodorderingapp/widgets/top_tittle.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isMale = false;
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();

  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);
  bool isLoading = false;
  UserCredential authResult;
  void submit() async {
    setState(() {
      isLoading = true;
    });
    try {
      authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
    } on PlatformException catch (e) {
      String message = "please check Internet";
      if (e.message != null) {
        message = e.message.toString();
      }
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
    await FirebaseFirestore.instance
        .collection("UserData")
        .doc(authResult.user?.uid)
        .set({
      "UserName": fullname.text,
      "UserEmail": email.text,
      "UserId": authResult.user?.uid,
      "UserNUmber": phonenumber.text,
      "UserAddress": address.text,
      "UserGender": isMale == true ? "Male" : "Female"
    });
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => HomePage()));
    setState(() {
      isLoading = false;
    });
  }

  void validation() {
    if (email.text.isEmpty &&
        password.text.isEmpty &&
        fullname.text.isEmpty &&
        address.text.isEmpty &&
        phonenumber.text.isEmpty) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("All Fields are Empty")),
      );
    } else if (fullname.text.isEmpty) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("FullName is Empty")),
      );
    } else if (email.text.isEmpty) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("Email is Empty")),
      );
    } else if (!regExp.hasMatch(email.text)) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("Email is not valid")),
      );
    } else if (phonenumber.text.isEmpty) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("PhoneNumber is Empty")),
      );
    } else if (phonenumber.text.length < 11) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("PhoneNumber must be 11 digits")),
      );
    } else if (address.text.isEmpty) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("Address is Empty")),
      );
    } else if (password.text.isEmpty) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("Password is Empty")),
      );
    } else if (password.text.length < 8) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("Password is too short")),
      );
    } else {
      submit();
    }
  }

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  Widget _buildAllTextFromField() {
    return Container(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyTextFormField(
              controller: fullname,
              title: "FullName",
            ),
            MyTextFormField(
              controller: email,
              title: "Email",
            ),
            MyTextFormField(
              controller: phonenumber,
              title: "PhoneNumber",
            ),
            MyTextFormField(
              controller: address,
              title: "Address",
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isMale = !isMale;
                });
              },
              child: Container(
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  isMale == false ? "Female" : "Male",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xfff5d8e4),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            MyPasswordTextFormField(controller: password, title: "Password"),
          ],
        ));
  }

  Widget _buildButtonPart() {
    return isLoading == false
        ? MyButton(
            name: "Sign Up",
            onPressed: () {
              validation();
            })
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget _buildHaveAccountOrNotPart() {
    return HaveAccountornot(
      tittle: "You Have Already An Account?",
      subtittle: "Login",
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => Login()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldMessengerKey,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Toptittle(tittle: "Sign Up", subtittle: "Create an Account",),
                _buildAllTextFromField(),
                SizedBox(height: 8,),
                _buildButtonPart(),
                SizedBox(height: 6,),
                _buildHaveAccountOrNotPart(),
              ],
            ),
          ]),
        ),
      );
  }
}
