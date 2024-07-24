import 'package:flutter/material.dart';
import 'package:geulnarae/src/sqlite_db/database_helper.dart';
import 'src/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  // 스플래시 시작 위한 코드
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // 네이티브 코드를 사용하는 경우 플랫폼 간 채널 통신(비동기)
  // 비동기 사용을 위해 WidgetBinding 보장
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper.instance;  // db instance 초기화



  await Future.delayed(Duration(seconds: 2), () {
    FlutterNativeSplash.remove();   // 3초 후 스플래시 종료
  });


  runApp(const MyApp());
}

