import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controller/my_controller.dart';

class ShowStudent extends StatelessWidget {
  const ShowStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 227, 188, 234),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.width/1.5,
                width: MediaQuery.of(context).size.width/1.5,
                decoration: BoxDecoration(
                  image: DecorationImage(image:FileImage(File(context.read<MyProvider>().editStidentModel!.image)),fit:BoxFit.cover),
                  borderRadius: BorderRadius.circular(1000)
                ),
              ),
              const SizedBox(height: 10,),
              Text('NAME : ${context.watch<MyProvider>().editStidentModel!.name}',style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),),
              const SizedBox(height: 10,),
              Text('AGE : ${context.watch<MyProvider>().editStidentModel!.age}',style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),),
              const SizedBox(height: 10,),
              Text('STANDERD : ${context.watch<MyProvider>().editStidentModel!.std}',style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),),
              const SizedBox(height: 10,),
              Text('PLACE : ${context.watch<MyProvider>().editStidentModel!.place}',style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),),
            ],
          ),
        ),
      ),
    );
  }
}