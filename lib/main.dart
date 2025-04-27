import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/homeScreen.dart';

import 'firebase/cubit/userCubit.dart';
import 'firebase/view/userList.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyDrssgs7ptVtl45E5jiOlSE15SyoGfeWbo',
      appId: '1:656783991102:android:7bf209ab6fd8b37d850c6f',
      messagingSenderId: 'bloclearn-fffcb',
      projectId: 'bloclearn-fffcb',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}

