import 'package:easy_travel/main_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isHidden = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "First name",
              border: OutlineInputBorder(),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Last name",
              border: OutlineInputBorder(),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Password",
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: _onVisibilityChange,
                icon: Icon(_isHidden ? Icons.visibility_off : Icons.visibility),
              ),
            ),
            obscureText: _isHidden,
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 48,
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
              child: Text("Register"),
            ),
          ),
        ),
      ],
    );
  }

  void _onVisibilityChange() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
