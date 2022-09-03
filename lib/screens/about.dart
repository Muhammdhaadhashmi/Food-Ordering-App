import 'package:flutter/material.dart';
import 'package:foodorderingapp/screens/home_page.dart';

class About extends StatelessWidget {
   About({Key key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,
        ),
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>HomePage()));
          },
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("About",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Text("Fast food refers to food that can be prepared and served quickly. It can come from many places: sit-down restaurants, counter service, take-out, drive-thru, and delivery. Fast food is popular because the food is inexpensive, convenient,Common menu items at fast food outlets include fish and chips, sandwiches, pitas, hamburgers, fried chicken, french fries, onion rings, chicken nuggets, tacos, pizza, hot dogs, and ice cream.",
          style: TextStyle(fontSize: 28),),
      ),
    );
  }
}
