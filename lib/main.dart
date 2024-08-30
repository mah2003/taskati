import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/Services/local_storsge.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/feature/intro/splash_view.dart';

Future<void> main() async {
  AppLocalStorage.init();
  await Hive.initFlutter();
  await Hive.openBox('userBox');
  await Hive.openBox<TaskModel>('taskBox');
  runApp(const Taskati());
}

class Taskati extends StatelessWidget {
  const Taskati({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Appcolor.blue,
        statusBarIconBrightness: Brightness.light));
    return MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              centerTitle: true,
            ),
            fontFamily: 'Poppins',
            inputDecorationTheme: const InputDecorationTheme(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Appcolor.blue)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Appcolor.blue)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Appcolor.red)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Appcolor.red)))),
        debugShowCheckedModeBanner: false,
        home: SplashView());
  }
}
