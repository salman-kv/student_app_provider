import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controller/my_controller.dart';
import 'package:student_app_provider/view/screens/add_page.dart';
import 'package:student_app_provider/view/screens/show_student.dart';
import 'package:student_app_provider/view/widget/search_bar.dart';
import 'package:student_app_provider/view/widget/single_student._show.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MyProvider>().refreshStudentModel();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Student App Provider',style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
        ),
        body: Column(
          children: [
            searhBox(context),
            Expanded(
              child: Consumer<MyProvider>(
                builder: (context, value, child) {
                  return GridView.count(
                    physics: const ScrollPhysics(),
                    crossAxisCount: 2,
                    children: List.generate(
                      context.watch<MyProvider>().studentDetails.length,
                      (index) => GestureDetector(
                        onTap: () {
                          context.read<MyProvider>().editStudentFunction(context.read<MyProvider>().studentDetails[index]);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return const ShowStudent();
                          },));
                        },
                        child: singleStudentShow(context,
                            context.watch<MyProvider>().studentDetails[index]),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<MyProvider>().imagePick = '';
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return AddPage();
            }));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
