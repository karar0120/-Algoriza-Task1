// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:shop/Constaness/constanesApp.dart';
import 'package:shop/SharedPref/shared_preferences.dart';
import '../Modal/onBoarding.dart';
import 'package:shop/Screens/login.dart';

class OnBoardingView {
  List<ContentOnBoarding> contentOnBoarding = [
    ContentOnBoarding(
        image: 'assets/images/shop2.png',
        title: 'Discover',
        Subtitle: "Expolore world's top brands and boutiques"),
    ContentOnBoarding(
        image: 'assets/images/shop1.png',
        title: 'Enjoy your shopping',
        Subtitle: 'Get high quality products for the bast prices '),
    ContentOnBoarding(
        image: 'assets/images/shop3.png',
        title: 'ORDER ONLINE',
        Subtitle: 'make an order sitting on a sofa pay and choose online'),
  ];

  var pagecontroller = PageController();

  // ignore: non_constant_identifier_names
  bool isLastPageView = false;

  void onChangePageView(int index) {
    if (index == contentOnBoarding.length - 1) {
      isLastPageView = true;
    } else {
      isLastPageView = false;
    }
  }

  void NextPageView() {
    pagecontroller.nextPage(
        duration: Duration(milliseconds: 750),
        curve: Curves.fastLinearToSlowEaseIn);
  }
  void SkipButton(context){
    ChasheHelper.SaveAllData(key:"onBoarding", value: true).then((value){
      if (value){
        NavigatorPushAndRemove(context, Login());
      }
    });
  }

}
