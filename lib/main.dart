import 'package:flutter/material.dart';
import 'package:geulnarae/src/sqlite_db/database_helper.dart';
import 'src/app.dart';

void main() {
  // 네이티브 코드를 사용하는 경우 플랫폼 간 채널 통신(비동기)
  // 비동기 사용을 위해 WidgetBinding 보장
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper.instance;  // db instance 초기화
  runApp(const MyApp());
}

