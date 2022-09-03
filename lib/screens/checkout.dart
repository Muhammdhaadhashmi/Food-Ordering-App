import 'package:flutter/material.dart';
import 'package:foodorderingapp/widgets/mybutton.dart';

import 'home_page.dart';

class CheckOut extends StatelessWidget {
   CheckOut({Key key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 250,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Theme.of(context).accentColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              leading: Text("Total",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25,color: Colors.white),
              ),
              trailing:  Padding(padding:EdgeInsets.only(top: 10),
                child: Text("\$50",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 25,fontWeight: FontWeight.w900),),
              ),
            ),
            MyButton(name: "Order",onPressed: (){},)
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,size: 30,
        ),
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>HomePage()));
          },
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("About",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.black),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 70,
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("images/chickenbrost.png"),
                    ),
                    title: Row(
                      children: [
                        Text("x1"),
                        SizedBox(width: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Star Hotel",style: TextStyle(fontSize: 18),),
                            SizedBox(height: 8,),
                            Text("Chicken Brost",style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Padding(padding:EdgeInsets.only(top: 10),
                      child: Text("\$50",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20,fontWeight: FontWeight.w900),),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 70,
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("images/pastacheese.png"),
                    ),
                    title: Row(
                      children: [
                        Text("x1"),
                        SizedBox(width: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("7 ocean Hotel",style: TextStyle(fontSize: 18),),
                            SizedBox(height: 8,),
                            Text("PastaCheese",style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Padding(padding:EdgeInsets.only(top: 10),
                      child: Text("\$50",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20,fontWeight: FontWeight.w900),),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
