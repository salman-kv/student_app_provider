import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controller/my_controller.dart';
import 'package:student_app_provider/model/student_model.dart';
import 'package:student_app_provider/view/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'montro',
          primarySwatch: Colors.deepPurple),
        home: const SplashScreen(),
      ),
    );
  }
}
