import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Data/web_service/Login/Login.dart';
import 'package:shop/ViewModal/ProductsCubit/ProductsCubit.dart';
import 'package:shop/ViewModal/ProductsCubit/ProductsState.dart';
import 'Constaness/blocObserver.dart';

import 'Screens/login.dart';
import 'Screens/onBoarding.dart';
import 'SharedPref/shared_preferences.dart';

void main() {
  BlocOverrides.runZoned(
    () async {
      WebService.init();
      WidgetsFlutterBinding.ensureInitialized();
      await ChasheHelper.init();
      late Widget widget;
      bool? isBoarding = ChasheHelper.getBoolean(key: "onBoarding");
      String? token = ChasheHelper.getBoolean(key: "token");
      print(token);
      print(isBoarding);
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductsCubit()..getAllHomeData())
      ],
      child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              fontFamily: 'jannah',
              primarySwatch: Colors.indigo,
              primaryColor: Colors.indigo,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                //selectedItemColor: Colors.indigo,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                elevation: 0.0,
                unselectedItemColor: Colors.black,
                selectedItemColor: Colors.indigo,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: OnBoarding(),
          );
        },
      ),
    );
  }
}
