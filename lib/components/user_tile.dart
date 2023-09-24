import 'package:app_crud/models/user.dart';
import 'package:app_crud/provider/users.dart';
import 'package:app_crud/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl == ''
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 80,
        child: Row(children: <Widget>[
          IconButton(
            tooltip: 'Edit',
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(AppRoutes.USER_FORM, arguments: user);
              },
              icon: const Icon(Icons.edit),
              color: Colors.grey[600]),
          IconButton(
            tooltip: 'Remove',  
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                        title: const Text('Delete User'),
                        content: const Text('Are you sure you want to delete?'),
                        actions: [
                          TextButton(
                            child: const Text('No'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Yes'),
                            onPressed: () {
                              Provider.of<Users>(context, listen: false)
                                  .remove(user);
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ));
            },
            icon: const Icon(Icons.delete),
            color: Colors.red[300],
          ),
        ]),
      ),
    );
  }
}
