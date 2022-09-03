import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodorderingapp/model/category_model.dart';

import '../model/feature_model.dart';

class MyProvider with ChangeNotifier{
  List<CategoryModel> categoryModelList=[];
  CategoryModel categoryModel;
  /////////// CategoryProduct////////////////

Future<void> getCategoryProduct()async{
  List<CategoryModel> list=[];
  QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection("homecategory").get();
   querySnapshot.docs.forEach((categorydata) {
     categoryModel=CategoryModel(
       image:categorydata["image"],
       name: categorydata["name"],
     );
     list.add(categoryModel);
   },
   );
   categoryModelList=list;
   notifyListeners();

}

List<CategoryModel>get  getcategoryModelList{
  return categoryModelList;
}


  List<FeatureModel> featureModelList=[];
  FeatureModel featureModel;
///////// FeatureFood///////////////////////////

  Future<void> getFeatureFood()async{
    List<FeatureModel> list=[];
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection("homefeaturefood").get();
    querySnapshot.docs.forEach((homeFeatureFood) {
      featureModel=FeatureModel(
        foodImage:homeFeatureFood["image"],
        foodSubstitle: homeFeatureFood["foodSubTitle"],
        foodTitle: homeFeatureFood["foodTitle"] ,
        price: homeFeatureFood["price"] ,
        rating: homeFeatureFood["rating"],
      );
      list.add(featureModel);
    },
    );
    featureModelList=list;
    notifyListeners();

  }

  List<FeatureModel>get  getfeatureModelList{
    return featureModelList;
  }


}