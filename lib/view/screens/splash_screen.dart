import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controller/my_controller.dart';

class SplashScreen extends StatelessWidget {
   const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MyProvider>().splashScreen(context);
    return  Scaffold(
      body: Container(
        color:const Color.fromARGB(255, 239, 218, 243),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset("assets/images/p-33753_1920.png",fit: BoxFit.contain,)),
            const Text('PROVIDER',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),)
          ],
        ),
      ),
    );
  }
}