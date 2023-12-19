
import 'package:hive_flutter/adapters.dart';
 part 'student_model.g.dart';
 
@HiveType(typeId: 0)
class StudentModel{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int age;
  @HiveField(3)
  final String place;
  @HiveField(4)
  final int std;
  @HiveField(5)
  final String image;

  StudentModel({required this.std,required this.id, required this.name, required this.age, required this.place, required this.image});

}