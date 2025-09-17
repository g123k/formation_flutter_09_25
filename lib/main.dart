import 'package:flutter/material.dart';
import 'package:untitled1/res/app_colors.dart';
import 'package:untitled1/res/app_theme_extension.dart';
import 'package:untitled1/screens/homepage/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
        primaryColor: AppColors.gray1,
        fontFamily: 'Avenir',
        extensions: [OffThemeExtension.defaultValues()],
        textTheme: TextTheme(
          titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
            color: AppColors.blue,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.gray2,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
        ),
        navigationBarTheme: const NavigationBarThemeData(
          indicatorColor: AppColors.blue,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
