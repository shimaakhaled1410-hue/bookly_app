import 'package:bookly_app/features/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bookly_app/constatnts.dart';



void main() {
  runApp(const bookly_app());
}

class bookly_app extends StatelessWidget {
  const bookly_app({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(scaffoldBackgroundColor: kPrimaryColor),
      home:const SplashView(),
    );
  }
}
