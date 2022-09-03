import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodorderingapp/widgets/mybutton.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/myTextFormField.dart';
import '../widgets/mypasswordtextformfield.dart';
import 'home_page.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEdit=false;
  bool isMale=false;
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();

  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);
   File image;
  Future<void> getImage({ImageSource imageSource}) async {
    PickedFile pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      //solved
    }
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
    } else {}
  }
  Future<void> myDialogueBox() {
    return showDialog<void>(
      builder: (context) => Builder(builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text("Camera"),
                  onTap: () {
                    getImage(
                      imageSource: ImageSource.camera,
                    );
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.album),
                  title: Text("Gallery"),
                  onTap: () {
                    getImage(
                      imageSource: ImageSource.gallery,
                    );
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }), context: context,
      barrierDismissible: false,
    );
  }
  // final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  Widget _buildAllTextFromField() {
    return Container(
      height: 450,
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
            MyButton(
              name: "Update", onPressed: (){
              validation();
            },),
          ],
        ));
  }
  Widget _buildSingleContainer({String name}){
    return  Container(
        height: 60,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Color(0xfffeeaf4),
          borderRadius: BorderRadius.circular(10),),
        padding: EdgeInsets.only(left: 10),
        child: Text(name,style: TextStyle(fontSize: 18,color: Colors.grey[700]),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:scaffoldMessengerKey ,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (ctx) => HomePage()));
          },
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Profile",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 10),
            child: GestureDetector(
              onTap: (){
                setState(() {

                  isEdit=! isEdit;
                });
              },
              child: Text(
               isEdit==false ? "Edit":"Close",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        maxRadius: 75,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          maxRadius: 70,
                          backgroundImage: AssetImage("images/haad.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: isEdit==false?Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildSingleContainer(name: "Muhammad Haad"),
                            SizedBox(height:25 ,),
                            _buildSingleContainer(name: "muhammad.haad96@gmail.com"),
                            SizedBox(height: 25,),
                            _buildSingleContainer(name: "03304582501"),
                            SizedBox(height: 25,),
                            _buildSingleContainer(name: "Male"),
                            SizedBox(height: 25,),
                            _buildSingleContainer(name: "Punjab,Pakistan"),
                            SizedBox(height: 25,),
                          ],
                        ):_buildAllTextFromField(),
                      ),
                    ),),
              ],
            ),
            isEdit==true? Positioned(
              top: 100,
                left: 220,
                child:CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 20,
                  child:IconButton(
                      onPressed: (){
                        myDialogueBox();
                      },
                      icon: Icon(Icons.edit,color: Colors.black,)
                  )
                ),
            ):Container(),
          ],
        ),
      ),
    );
  }
}
