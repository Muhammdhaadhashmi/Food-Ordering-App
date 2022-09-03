import 'package:flutter/material.dart';
import 'package:foodorderingapp/screens/home_page.dart';
import '../widgets/mybutton.dart';
class DetailScreen extends StatefulWidget {
  final String image,foodName,foodTitle;
  final double price;
  DetailScreen({this.price,this.foodTitle,this.image,this.foodName});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Widget _buildSingleDetailText(
      {context,
        String title,
        String subTitle,
        String trailingTitle,
        String trailingSubsTitle
      })
  {
    return Container(
      height: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 22,
                ),
              ),
              Text(
                trailingTitle,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subTitle,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w900),
              ),
              Text(
                trailingSubsTitle,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  int counter=1;
  double totalPrice;

  @override
  Widget build(BuildContext context) {
    setState(() {
      totalPrice=widget.price * counter;
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xfffef0f7),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>HomePage()));
          },
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    color: Color(0xfffef0f7),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    color: Color(0xfff8f8f8),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 130,
                            alignment: Alignment.bottomLeft,
                            child: Text(
                             widget.foodName,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                           widget.foodTitle,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$${totalPrice.toStringAsFixed(1)}",
                                      style: TextStyle(
                                          color:  Color(0xff04d4ee),
                                          fontSize: 25,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Container(
                                      height: 35,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlue[100],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                counter++;
                                              });
                                            },
                                            child: Icon(
                                              Icons.add,
                                              size: 30,
                                              color:  Color(0xff04d4ee),
                                            ),
                                          ),
                                          Text(
                                            counter.toString(),
                                            style: TextStyle(
                                                color:  Color(0xff04d4ee),
                                                fontSize: 25,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if(counter>1){
                                                setState(() {
                                                  counter--;
                                                });
                                              }
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              size: 30,
                                              color:  Color(0xff04d4ee),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          _buildSingleDetailText(
                            context: context,
                            title: "Weight",
                            subTitle: "120Kg",
                            trailingTitle: "Mix Together",
                            trailingSubsTitle: "Milk Egg , Dip",
                          ),
                          _buildSingleDetailText(
                            context: context,
                            title: "Calories",
                            subTitle: "420 cal",
                            trailingTitle: "Chicken in this",
                            trailingSubsTitle: "Mixture",
                          ),
                          SizedBox(height: 15,),
                          MyButton(
                            name: "CheckOut",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 80,
              child: Image(
                  height: 210,
                  width: 230,
                  image: NetworkImage(widget.image)),
            ),
          ],
        ),
      ),
    );
  }
}
