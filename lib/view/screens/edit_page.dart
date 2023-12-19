import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controller/my_controller.dart';
import 'package:student_app_provider/model/student_model.dart';

// ignore: must_be_immutable
class EditPage extends StatelessWidget {

  EditPage({super.key});

   TextEditingController _name = TextEditingController();
   TextEditingController _age = TextEditingController();
   TextEditingController _place = TextEditingController();
   TextEditingController _std = TextEditingController();
   var _formkey = GlobalKey<FormState>();

  
  @override
  Widget build(BuildContext context) {
    _name.text=context.read<MyProvider>().editStidentModel!.name;
    _age.text=context.read<MyProvider>().editStidentModel!.age.toString();
    _place.text=context.read<MyProvider>().editStidentModel!.place;
    _std.text=context.read<MyProvider>().editStidentModel!.std.toString();
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const Text(
                ' Name ',
                style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _name,
                decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                ' Age ',
                style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _age,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Age',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                ' Place ',
                style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _place,
                decoration: InputDecoration(
                    hintText: 'Place',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                ' Standard ',
                style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _std,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Standard',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),

                   Center(
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: context.watch<MyProvider>().imagePick==''
                          ? const Center(child: Text('Pls Select image'))
                          : Image.file(File(context.watch<MyProvider>().imagePick)),
                    ),
                  ),
              const SizedBox(
                height: 15,
              ),
              Center(
                  child: SizedBox(
                width: 180,
                height: 40,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    onPressed: () {
                      context.read<MyProvider>().selectImage();
                    },
                    child: const Text('select image')),
              )),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    StudentModel val = StudentModel(
                      id: context.read<MyProvider>().editStidentModel!.id,
                      name: _name.text,
                      age: int.parse(_age.text),
                      place: _place.text,
                      std: int.parse(_std.text),
                      image: context.read<MyProvider>().imagePick,
                    );
                    context.read<MyProvider>().editStudentFunction(val);
                    context.read<MyProvider>().addData(val);

                    
                  },
                  child: const Text('select image')),
            ],
          ),
        ),
      ),
    );
  }
}
