import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:sizer/sizer.dart';
import 'package:trivia_app/cubits/cubit/home_cubit.dart';
import 'package:trivia_app/presentation/screens/home/home_page_view.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return BlocProvider(
        create: (context) => HomeCubit(),
        child: MaterialApp(
          title: 'Trivia Quiz App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
          ),
          home: HomeScreen(),
        ),
      );
    });
  }
}
