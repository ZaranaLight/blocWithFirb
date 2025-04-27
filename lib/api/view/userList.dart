import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/api/cubit/userCubit.dart';
import 'package:untitled/api/state/userState.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users Screen'), actions: []),
      body: BlocBuilder<UserApiCubit, UserApiState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is UserLoadedState) {
            return ListView.builder(
              itemCount: state.userModel.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  color: Colors.green.withValues(alpha: 0.15),
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(state.userModel[index].name ?? ""),
                        Text(state.userModel[index].email ?? ""),
                        Text(state.userModel[index].address?.city ?? ""),
                        Text(state.userModel[index].address?.street ?? ""),
                        Text(state.userModel[index].company?.name ?? ""),
                        Text(state.userModel[index].company?.bs ?? ""),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          if (state is UserErrorState) {
            return Center(child: Text(state.errorMessage ?? ""));
          }
          return SizedBox();
        },
      ),
    );
  }
}
