import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodorderingapp/screens/signup.dart';
import 'package:foodorderingapp/widgets/mybutton.dart';
import 'package:foodorderingapp/widgets/mypasswordtextformfield.dart';
import 'package:foodorderingapp/widgets/top_tittle.dart';
import '../widgets/haveaccount_or not.dart';
import '../widgets/myTextFormField.dart';
import 'home_page.dart';

class Login extends StatefulWidget {


  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email=TextEditingController();

  bool isLoading=false;
   UserCredential authResult;
  void submit()async{
    setState((){
      isLoading =true;
    });
    try{
      authResult=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>HomePage()));
    }on PlatformException catch(e){
      String message="please check Internet";
      if(e.message!=null){
        message=e.message.toString();
      }
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text(message.toString()),
        ),
      );
      setState(() {
        isLoading=false;
      });
    } catch(e){
      setState(() {
        isLoading=false;
      });
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text(e.toString()),
        ),
      );
      setState(() {
        isLoading=false;
      });
    }
    setState(() {
      isLoading=false;
    });
  }


  static String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);

  void validation(){
    if(email.text.isEmpty && password.text.isEmpty){
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("Both Field is Empty")
        ),
      );
    }
    else if(email.text.isEmpty){
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("Email is Empty")
        ),
      );
    }
    else if(!regExp.hasMatch(email.text)) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("Email is not valid")
        ),
      );
    }
    else if(password.text.isEmpty){
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("Password is Empty")
        ),
      );
    } else if(password.text.length<8) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("Password is too short")
        ),
      );
    }
    else{
      submit();
    }
  }
  // final GlobalKey<ScaffoldState> scaffold= GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final TextEditingController password=TextEditingController();

  Widget _buildAllTextFormFieldPlace(){
    return   Center(
      child: Container(
        height: 250,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextFormField(title: "Email",controller: email,),
            SizedBox(height: 10,),
            MyPasswordTextFormField(title: "Password",controller: password,)
          ],
        ),
      ),
    );
  }
  Widget _buildButtonPart(){
    return
    isLoading==false? MyButton(name: "Login", onPressed: (){validation();
    }):Center(
      child: CircularProgressIndicator(),
    );
  }
  Widget _buildHaveAccountOrNotPart(){
    return HaveAccountornot(tittle: "I Don't Have An Account?",subtittle:"Sign Up",
      onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SignUp()));
      },
    );


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldMessengerKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff8f8f8),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Toptittle(tittle: "Login", subtittle: "Welcome Back!"),
              _buildAllTextFormFieldPlace(),
              _buildButtonPart(),
              SizedBox(height: 10,),
              _buildHaveAccountOrNotPart(),
            ],
          ),
        ),
      ),
    );
  }
}
