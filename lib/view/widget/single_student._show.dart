import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controller/my_controller.dart';
import 'package:student_app_provider/model/student_model.dart';
import 'package:student_app_provider/view/screens/edit_page.dart';


Widget singleStudentShow(BuildContext context, StudentModel data) {
  return Container(
    height: 300,
    width: MediaQuery.of(context).size.width / 2,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.amber,
    ),
    margin: const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          minRadius: 70,
          backgroundImage: FileImage(
            File(data.image),
          ),
        ),
        Text(
          data.name,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        Text(
          data.std.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                context.read<MyProvider>().editStudentFunction(data);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return EditPage();
                },));
              },
              icon: const Icon(
                Icons.edit,
                size: 35,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            IconButton(
              onPressed: () {
                context.read<MyProvider>().deleteData(data.id);
              },
              icon: const Icon(
                Icons.delete,
                size: 35,
                color: Colors.red,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
