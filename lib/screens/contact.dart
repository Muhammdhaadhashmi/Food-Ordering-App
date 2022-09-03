import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodorderingapp/widgets/myTextFormField.dart';import '../widgets/mybutton.dart';
import 'home_page.dart';

class Contact extends StatefulWidget {
  static String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final TextEditingController email=TextEditingController();
  final TextEditingController fullname=TextEditingController();
  final TextEditingController message=TextEditingController();

  void validation(){
    if(email.text.isEmpty){
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("All Field is Empty")
        ),
      );
    }
    else if(fullname.text.isEmpty){
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("Full Name is Empty")
        ),
      );
    }
    else if(email.text.isEmpty){
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("Email is Empty")
        ),
      );
    }
    else if(!Contact.regExp.hasMatch(email.text)) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("Email is not valid")
        ),
      );
    }
    else if(message.text.isEmpty){
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("Message is Empty")
        ),
      );
    }
    else{
    }
  }

  // final GlobalKey<ScaffoldState> scaffold= GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldMessengerKey,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,
        ),
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>HomePage()));
          },
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Contact",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyTextFormField(
                      controller: fullname,
                      title: "Full Name",
                    ),
                    MyTextFormField(
                      controller: email,
                      title: "Email",
                    ),
                    MyTextFormField(
                      controller: message,
                      title: "Message",
                    ),
                    MyButton(
                      name:"Send",
                      onPressed: (){
                        validation();
                      },
                    ),
                  ],
                  ),
                ),
            ),
            Expanded(
                child: Container()
            )
          ],
        ),
      ),

    );
  }
}
