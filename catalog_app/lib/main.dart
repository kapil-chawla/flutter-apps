import 'package:catalog_app/constants/app_constants.dart';
import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/screens/cart_page.dart';
import 'package:catalog_app/screens/home_page.dart';
import 'package:catalog_app/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'widgets/theme.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  final appTitle = AppConstants.app_title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      home: LoginPage(),
      // initialRoute: AppConstants.homeRoute,
      routes: {
        AppConstants.homeRoute: (context) => HomePage(),
        AppConstants.cartRoute: (context) => CartPage(),
      },
    );
  }
}
