import 'package:app_crud/components/app_bar.dart';
import 'package:app_crud/components/user_tile.dart';
import 'package:app_crud/provider/users.dart';
import 'package:app_crud/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: MyAppBar(text: 'User List'),
      body: Container(
        margin: const EdgeInsets.only(top: 48),
        child: Center(
          child: SizedBox(
            width: 500,
            child: ListView.builder(
                itemCount: users.count,
                itemBuilder: (ctx, i) => UserTile(user: users.byIndex(i))),
          ),
        ),
        
      ),
    );
  }
}
