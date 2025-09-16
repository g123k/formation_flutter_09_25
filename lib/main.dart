import 'package:flutter/material.dart';
import 'package:untitled1/demo.dart';
import 'package:untitled1/res/app_colors.dart';
import 'package:untitled1/res/app_theme_extension.dart';

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
        extensions: [AppTheme.light()],
        textTheme: TextTheme(
          titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      ),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(extensions: [AppTheme.dark()]),
      home: const StackDemo(),
    );
  }
}
