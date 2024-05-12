import 'package:flutter/material.dart';
import 'package:mesaj/componest/my_button.dart';
import 'package:mesaj/componest/my_text_field.dart';
import 'package:mesaj/services/auth/auth_services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign in
  void signIn() async {
// get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signInWithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                //logo
                const Icon(
                  Icons.message,
                  size: 100,
                  color: Colors.grey,
                ),
                //welcome
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Welcome back you",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 50,
                ),

                //email
                MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false),

                //password
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true),

                const SizedBox(
                  height: 25,
                ),

                //sign in
                MyButton(onTap: signIn, text: "Sign in"),

                const SizedBox(
                  height: 50,
                ),

                //not a member
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not a member?"),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Register now",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
