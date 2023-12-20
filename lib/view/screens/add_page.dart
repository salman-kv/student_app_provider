import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controller/my_controller.dart';
import 'package:student_app_provider/model/student_model.dart';
import 'package:student_app_provider/view/widget/notifires.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});

  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _place = TextEditingController();
  final TextEditingController _std = TextEditingController();
  final _nameKey = GlobalKey<FormFieldState>();
  final _ageKey = GlobalKey<FormFieldState>();
  final _placeKey = GlobalKey<FormFieldState>();
  final _stdKey = GlobalKey<FormFieldState>();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Information',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
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
                key: _nameKey,
                validator: (value) {
                  if ((!RegExp(r'^\S+(?!\d+$)').hasMatch(value!))) {
                    return 'enter valid catogory';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  _nameKey.currentState!.validate();
                },
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
                key: _ageKey,
                validator: (value) {
                  if ((!RegExp(r'^[0-9]+\.?[0-9]*$').hasMatch(value!))) {
                    return 'enter valid amount';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  _ageKey.currentState!.validate();
                },
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
                key: _placeKey,
                onChanged: (value) {
                  _placeKey.currentState!.validate();
                },
                validator: (value) {
                  if ((!RegExp(r'^\S+(?!\d+$)').hasMatch(value!))) {
                    return 'enter valid catogory';
                  } else {
                    return null;
                  }
                },
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
                key: _stdKey,
                onChanged: (value) {
                  _stdKey.currentState!.validate();
                },
                validator: (value) {
                  if ((!RegExp(r'^[0-9]+\.?[0-9]*$').hasMatch(value!))) {
                    return 'enter valid amount';
                  } else {
                    return null;
                  }
                },
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
                  child: context.watch<MyProvider>().imagePick == ''
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
                    child: const Text(
                      'Select image',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
              )),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      if (context.read<MyProvider>().imagePick == '') {
                        errorSnackBar(context, 'pls add image');
                        _formkey.currentState!.validate();
                        return;
                      }
                      if (_formkey.currentState!.validate()) {
                        StudentModel val = StudentModel(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          name: _name.text,
                          age: int.parse(_age.text),
                          place: _place.text,
                          std: int.parse(_std.text),
                          image: context.read<MyProvider>().imagePick,
                        );
                        context.read<MyProvider>().addData(val);
                        context.read<MyProvider>().imagePick='';
                        _name.text='';
                        _age.text='';
                        _place.text='';
                        _std.text='';
                        successSnackBar(context, 'Student details added');
                      }
                    },
                    child: const Text(
                      'SUBMIT',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
