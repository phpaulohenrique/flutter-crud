import 'package:app_crud/provider/users.dart';
import 'package:app_crud/routes/app_routes.dart';
import 'package:app_crud/views/user_form.dart';
import 'package:app_crud/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (ctx) => Users())],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          routes: {
            AppRoutes.HOME: (ctx) => UserList(),
            AppRoutes.USER_FORM: (ctx) => UserForm()
          },
        ));
  }
}
