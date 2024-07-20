
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:geulnarae/src/color/app_colors.dart';

import 'screens/home/home.dart';
import 'screens/intro/intro.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // 텍스트 테마 설정
        textTheme: const TextTheme(
            labelLarge: TextStyle(
              color: AppColors.color_1,
              fontSize: 16,
              fontFamily: 'Noto Sans KR',
              fontWeight: FontWeight.bold
            )
        ),

        // TextField 테마 설정
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: AppColors.color_5),
          contentPadding: EdgeInsets.all(8.0)
        ),
        
        // 버튼 테마 설정
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.color_5,
                padding: const EdgeInsets.symmetric(vertical: 22),
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                )
            )
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                foregroundColor: AppColors.color_1,
                textStyle: const TextStyle(fontWeight: FontWeight.bold)
            )
        ),
        
      ),
      routes: {
        '/' : (context) => Home(),
        '/intro' : (context) => Intro(),
      },
      initialRoute: '/',

    );
  }
}
