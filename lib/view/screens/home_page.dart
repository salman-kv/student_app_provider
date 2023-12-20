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
                  return value.studentDetails.isEmpty ? const Center(child: Text('No data found',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),) : GridView.count(
                    physics: const ScrollPhysics(),
                    crossAxisCount: 2,
                    children: List.generate(
                      value.studentDetails.length,
                      (index) => GestureDetector(
                        onTap: () {
                          value.editStudentFunction(value.studentDetails[index]);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return const ShowStudent();
                          },));
                        },
                        child: singleStudentShow(context,
                            value.studentDetails[index]),
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
