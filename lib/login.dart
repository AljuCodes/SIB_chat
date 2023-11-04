import 'package:flutter/material.dart';

import 'main.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: emailController,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(height: 20.0),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true, // To hide the password input
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            // Handle the login logic here
            final email = emailController.text;
            final password = passwordController.text;
            // You can add your authentication logic here.
            print('Email: $email');
            print('Password: $password');
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const TabBarExample()),
              (route) => false,
            );
          },
          child: Text('Login'),
        ),
      ],
    );
  }
}
