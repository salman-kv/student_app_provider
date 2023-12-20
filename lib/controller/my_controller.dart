import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app_provider/model/student_model.dart';
import 'package:student_app_provider/view/screens/home_page.dart';

class MyProvider extends ChangeNotifier {
  String studentModelDb = 'Student_model_db';
  String imagePick = '';
  List<StudentModel> studentDetails = [];

  Future<void> splashScreen(BuildContext context) async {
    Timer(const Duration(milliseconds: 1500), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return const HomePage();
      },));
    });
  }

  Future<void> selectImage() async {
    var imageXfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    imagePick = imageXfile!.path;
    notifyListeners();
  }

  Future<void> addData(StudentModel studentModel) async {
    var db = await Hive.openBox<StudentModel>(studentModelDb);
    await db.put(studentModel.id, studentModel);
    refreshStudentModel();
  }

  refreshStudentModel() async {
    studentDetails.clear();
    var db = await Hive.openBox<StudentModel>(studentModelDb);
    for (var element in db.values) {
      studentDetails.add(element);
    }
    notifyListeners();
  }

  searchData(String data) async {
    await refreshStudentModel();
    List<StudentModel> temp=[];
    temp.addAll(studentDetails);
    studentDetails.clear();
    for (var element in temp) {
      if(element.name.contains(data)){
        studentDetails.add(element);
      }
    }
  }

  StudentModel? editStidentModel;

  editStudentFunction(StudentModel studentModel) {
    editStidentModel = studentModel;
    imagePick = studentModel.image;
  }

  deleteData(String id) async {
    var db = await Hive.openBox<StudentModel>(studentModelDb);
    db.delete(id);
    refreshStudentModel();
  }
}
