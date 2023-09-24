import 'package:app_crud/components/app_bar.dart';
import 'package:app_crud/models/user.dart';
import 'package:app_crud/provider/users.dart';
import 'package:app_crud/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id!;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  var user;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    user = ModalRoute.of(context)?.settings.arguments;
    if (user != null) {
      user as User;
      _loadFormData(user);
    } else {
      user as Null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          text: user != null ? 'Editing user' : 'Add new user'),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 14, right: 14),
          margin: const EdgeInsets.only(top: 38),
          width: 700,
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                    initialValue: _formData['name'],
                    decoration: const InputDecoration(
                        labelText: 'Name *',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Colors.blueAccent))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Fill in your name.';
                      }
                      if (value.trim().length < 3) {
                        return 'Invalid Name. use at least 3 characters.';
                      }
                      // return true;
                    },
                    onSaved: (value) => _formData['name'] = value!),
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: TextFormField(
                    initialValue: _formData['email'],
                    decoration: const InputDecoration(
                        labelText: 'E-mail Address *',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Colors.blueAccent))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Fill in your E-mail.';
                      }
                    },
                    onSaved: (value) => _formData['email'] = value!,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: TextFormField(
                    initialValue: _formData['avatarUrl'],
                    decoration: const InputDecoration(
                        labelText: 'Avatar URL',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Colors.blueAccent))),
                    onSaved: (value) => _formData['avatarUrl'] = value!,
                  ),
                ),
                Container(
                  width: 200,
                  margin: const EdgeInsets.only(top: 32),
                  child: ElevatedButton(
                    onPressed: () {
                      final isFormValid = _form.currentState?.validate();

                      if (isFormValid == true) {
                        _form.currentState?.save();

                        Provider.of<Users>(context, listen: false).put(
                          User(
                            id: _formData['id'],
                            name: _formData['name']!,
                            email: _formData['email']!,
                            avatarUrl: _formData['avatarUrl']!,
                          ),
                        );

                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.HOME);
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.only(top: 18, bottom: 18),
                        backgroundColor: Colors.blue[700],
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
