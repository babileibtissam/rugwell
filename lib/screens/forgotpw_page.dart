import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rugwell/widgets/app_input.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Password reset link sent! check your Email"),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 207, 207, 207),
      appBar: AppBar(
        title: Text("Reset your password"),
        backgroundColor: Color.fromARGB(255, 144, 69, 63),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          child: Text(
            "Enter your Email and we will send you a password reset link ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 30),
        //Email textfield
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          child: AppInput(
            autofocus: false,
            textController: _emailController,
            obscureText: false,
            hintText: 'Email',
            validator: (value) => EmailValidator.validate(value)
                ? ""
                : "Please enter a valid email",
          ),
        ),

        SizedBox(height: 20),

        //reset button
        MaterialButton(
          onPressed: passwordReset,
          padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 13),
          child: Text(
            "Reset Password",
            style: TextStyle(color: Colors.white),
          ),
          color: Color.fromARGB(255, 149, 66, 60),
        )
      ]),
    );
  }
}
