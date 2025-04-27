import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/api/cubit/userCubit.dart';
import 'package:untitled/api/repo/userRepo.dart';

import 'api/view/userList.dart';
import 'firebase/cubit/userCubit.dart';
import 'firebase/view/userList.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context1) {
    return Scaffold(
      backgroundColor: Theme.of(context1).primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Future.delayed(Duration.zero, () {
                  Navigator.push(
                    context1,
                    MaterialPageRoute(
                      builder:
                          (context) => BlocProvider(
                            create: (context) => UserCubit(),
                            child: UserListScreen(),
                          ),
                    ),
                  );
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 50),

                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.orangeAccent,
                ),

                child: Center(child: Text('Firebase CRUD with BLOC & CUBIT')),
              ),
            ),

            SizedBox(height: 15),
            InkWell(
              onTap: () {


                Future.delayed(Duration.zero, () {
                  Navigator.push(
                    context1,
                    MaterialPageRoute(
                      builder:
                          (context) => BlocProvider<UserApiCubit>(
                            create: (context) => UserApiCubit(UserRepo())..onLoadUsers(),

                            child: UserList(),
                          ),
                    ),
                  );
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 50),

                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.greenAccent,
                ),

                child: Center(child: Text('API with BLOC & CUBIT')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
