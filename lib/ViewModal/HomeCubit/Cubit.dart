import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Modal/Products.dart';

import 'package:shop/ViewModal/HomeCubit/state.dart';
import 'package:shop/const.dart';

import '../../Data/web_service/Login/Login.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<Widget> BottomNavigationWidget = [

  ];
  int CurrentIndex = 0;

  void BottomNavigationBar(int IndexTab) {
    CurrentIndex = IndexTab;
    emit(BottomNavigationBarState());
  }

  late AllHomeData allHomeData;
  void getAllHomeData(){
    emit(HomeLoadingState());
    WebService.GetAllUsers(url:'home',token:Token).then((value){
      emit(HomeEnterState());
      allHomeData=AllHomeData.fromJson(value.data);
      print (allHomeData.data!.products![0].price);
    }).catchError((error){
      emit(HomeErrorState());
      print (error.toString());
    });

  }



}
