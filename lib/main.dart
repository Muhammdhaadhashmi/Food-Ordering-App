import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodorderingapp/provider/myprovider.dart';
import 'package:foodorderingapp/screens/home_page.dart';
import 'package:foodorderingapp/screens/login.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const
  MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) ;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<MyProvider>(
      create:(ctx)=>MyProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'food Ordering',
        theme: ThemeData(
          snackBarTheme: SnackBarThemeData(
            actionTextColor: Colors.white,
            backgroundColor: Colors.pinkAccent,
          ),
          primaryColor: Colors.pinkAccent,
        ),
        home:StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return Login();
            }
          }
        ),
      ),
    );
  }
}

