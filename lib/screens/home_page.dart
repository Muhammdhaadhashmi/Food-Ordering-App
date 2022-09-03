import 'package:flutter/material.dart';
import 'package:foodorderingapp/provider/myprovider.dart';
import 'package:foodorderingapp/screens/about.dart';
import 'package:foodorderingapp/screens/detail_screen.dart';
import 'package:foodorderingapp/screens/profile.dart';
import 'package:foodorderingapp/screens/skip_screen.dart';
import 'package:provider/provider.dart';
import '../methods/method.dart';
import 'contact.dart';

class HomePage extends StatelessWidget {
  Widget _buildSingleFeature({
    context,
    String foodTitle,
    String image,
    foodSubTitle,
    double rating,
    double price,
  })
  {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            height: 230,
            width: 210,
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  foodTitle,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                ),
                Text(
                  foodSubTitle,
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[600],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${rating.toString()}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "\$${price.toString()}",
                        style: TextStyle(
                            color:  Color(0xff04d4ee),
                            fontSize: 22,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        CircleAvatar(
          maxRadius: 60,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(
            image,
          ),
        ),
      ],
    );
  }

  Widget _buildSingleCategory({String image, String name}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 200,
        width: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image),
                      ),
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _buildTopPart(context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.sort,
                      size: 35,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.notifications,
                      size: 35,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                maxRadius: 45,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  maxRadius: 40,
                                  backgroundImage: AssetImage("images/haad.png"),
                                ),
                              ),
                              Container(
                                height: 80,
                                width: 180,
                                child: ListTile(
                                  title: Text(
                                    "Have you upset",
                                    style: TextStyle(
                                      fontSize: 21,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Stomach?",
                                    style: TextStyle(
                                      fontSize: 21,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
  MyProvider myProvider;

  Widget _buildFeaturedProduct(context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Color(0xfff2f3f4),
            child: Column(
              children: [
              Container(
                height: 240,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 240,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                          itemCount: myProvider.getfeatureModelList.length,
                          itemBuilder: (ctx,index)=> GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>DetailScreen(
                                foodName:  myProvider.featureModelList[index].foodTitle,
                                foodTitle: myProvider.featureModelList[index].foodSubstitle,
                                image: myProvider.featureModelList[index].foodImage,
                                price: myProvider.featureModelList[index].price,

                              )));
                            },
                            child: _buildSingleFeature(
                              foodSubTitle: myProvider.featureModelList[index].foodSubstitle,
                              foodTitle: myProvider.featureModelList[index].foodTitle,
                              image:  myProvider.featureModelList[index].foodImage,
                               price: myProvider.featureModelList[index].price,
                               rating: myProvider.featureModelList[index].rating,

                      ),
                          )
                      )
                    ),
                  ],
                ),
              ),
                    ],
                ),
          ),
            );
  }

  Widget _buildBottomPart(context) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Color(0xfff2f3f4),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                        height: 240,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: myProvider.getcategoryModelList.length,
                                itemBuilder: (ctx,index)=>_buildSingleCategory(
                                  name: myProvider.getcategoryModelList[index].name,
                                  image: myProvider.getcategoryModelList[index].image,
                                ),
                            ),
                            // _buildSingleCategory(name: "Pizza", image: "pizza"),
                            // _buildSingleCategory(name: "Salad", image: "salad"),
                            // _buildSingleCategory(name: "Burgar", image: "bargar"),
                      ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color:  Color(0xff04d4ee),
                    ),
                  ),
                  Text(
                    "see all",
                    style: TextStyle(
                      fontSize: 23,
                      color:  Color(0xff04d4ee),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _buildFeaturedProduct(context),
          ],
        ),
      ),
    );
  }


  Widget _buildMyDrawer(context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/haad.png"),
            ),
            accountName: Text("Muhammad Haad"),
            accountEmail: Text("muhammad.haad96@gmail.com"),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SkipScreen()));
            },
            leading: Icon(
              Icons.home,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("HomePage"),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen()));
            },
            title: Text("Profile"),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>Contact()));
            },
            leading: Icon(
              Icons.contact_phone,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            title: Text("Contact Us"),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>About()));
            },
            leading: Icon(
              Icons.info,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("About Page"),
          ),
          ListTile(
            onTap: (){
            },
            leading: Icon(
              Icons.shopping_cart,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("Order"),
          ),
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.exit_to_app,size: 30,),
              onPressed: ()=> logOut(context),
              color: Theme.of(context).primaryColor,
            ),
            onTap: (){},
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    myProvider=Provider.of<MyProvider>(context);
    myProvider.getCategoryProduct();
    myProvider.getFeatureFood();
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildMyDrawer(context),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              _buildTopPart(context),
              _buildBottomPart(context),
            ],
          ),
        ),
      ),
    );
  }
}
