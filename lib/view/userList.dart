import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/userCubit.dart';
import '../model/user.dart';
import '../state/userState.dart';

class UserListScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  UserListScreen({super.key});

  void showAddUserDialog(
      BuildContext context1, {
        bool? isUpdate = false,
        String? updatedId,
      }) {
    showDialog(
      context: context1,
      builder: (context) {
        return AlertDialog(
          title: Text("Add User"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final user = User(
                  id: DateTime.now().toString(),
                  name: nameController.text,
                  email: emailController.text,
                );
                if (isUpdate!) {
                  context1.read<UserCubit>().updateUSer(updatedId!, user);
                } else {
                  context1.read<UserCubit>().addUSer(user);
                }
                Navigator.of(context).pop();
                nameController.clear();
                emailController.clear();
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showAddUserDialog(context);
            },
          ),
        ],
      ),
      body:StreamBuilder<List<User>>(
        stream: context.read<UserCubit>().getUsers(),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final users = snapshot.data;
          return ListView.builder(
            itemCount: users?.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                title: Text(users?[index].name ?? ""),
                subtitle: Text(users?[index].email ?? ""?? ""),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          nameController.text =
                              users?[index].name ?? "";
                          emailController.text =
                              users?[index].email ?? "";

                          showAddUserDialog(
                            context,
                            isUpdate: true,
                            updatedId: users?[index].id,
                          );
                        },
                        icon: Icon(Icons.edit, size: 15),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<UserCubit>().deleteUser(users![index].id);


                        },
                        icon: Icon(Icons.delete, size: 15),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
