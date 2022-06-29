import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/ViewModal/ProductsCubit/ProductsState.dart';

import '../../Data/web_service/Login/Login.dart';
import '../../Modal/Products.dart';
import '../../const.dart';

class ProductsCubit extends Cubit<ProductsState>{
  ProductsCubit() : super(InitialProductsState());

 static ProductsCubit get(context)=>BlocProvider.of(context);


   AllHomeData? allHomeData;
  void getAllHomeData(){
    emit(ProductsLoadingState());
    WebService.GetAllUsers(url:'home',token:Token).then((value){
      emit(ProductsEnterState());
      allHomeData=AllHomeData.fromJson(value.data);
      print (allHomeData!.data!.products![0].price);
    }).catchError((error){
      emit(ProductsErrorState());
      print (error.toString());
    });

  }

}