import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controller/my_controller.dart';

Widget searhBox(BuildContext context) {
  TextEditingController searchKey=TextEditingController();
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SearchBar(
      controller: searchKey,
      hintText: 'Search',
      hintStyle: const MaterialStatePropertyAll(TextStyle(
        fontSize: 18
      )),
      leading: const Icon(Icons.search),
      trailing: [
        IconButton(
            onPressed: () {
              context.read<MyProvider>().refreshStudentModel();
               searchKey.text='';
            },
            icon: const Icon(Icons.close))
      ],
      onChanged: (value) {
        if (value.isEmpty) {
          context.read<MyProvider>().refreshStudentModel();
        } else {
          context.read<MyProvider>().searchData(value);
        }
      },
    ),
  );
}
