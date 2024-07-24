import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geulnarae/src/controllers/auth_controller.dart';
import 'package:geulnarae/src/screens/home/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('로그인'),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: authController.idTextController,
                decoration: InputDecoration(
                  hintText: '아이디를 입력하세요'
                ),
              ),

              TextField(
                controller: authController.passwdTextController,
                decoration: InputDecoration(
                    hintText: '비밀번호를 입력하세요'
                ),
              ),
              SizedBox(height: 70),

              ElevatedButton(
                  onPressed: (){
                    Get.offAll(() => Home());
                  },
                  child: const Text('로그인')
              ),

            ],
          ),
        ),
      ),
    );
  }
}
