import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rugwell/widgets/app_button.dart';

import '../widgets/app_input.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  // final VoidCallback showLoginPage;
  RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // FocusNode _focusNode = FocusNode();
  // text controllers
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  //helps memory management
  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  // signUp method
  Future signUp() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    //try to sign up
    try {
      if (_passwordController.text == _confirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
      } else {
        Navigator.pop(context);
        // show error message, password don't match
        return showErrorMessage('Password don\'t match!');
      }
      //pop loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop loading circle
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
    ;
  }

  // show error message
  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(
                message,
                style: const TextStyle(
                  color: Color.fromARGB(255, 152, 97, 93),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 207, 207, 207),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.store_mall_directory,
                  size: 110,
                ),
                const SizedBox(height: 5),
                //saying register now

                const Text(
                  "Register Now",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                const Text(
                  "Create an account",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),

                // UserName textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: Form(
                    child: AppInput(
                      autofocus: false,
                      obscureText: false,
                      formatters: [
                        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                      ],
                      textController: _usernameController,
                      hintText: 'Username',
                      validator: (value) {
                        if (value == "") {
                          return "Please fill Username";
                        }
                        return "";
                      },
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(2)),
                const SizedBox(height: 10),
                //Email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: AppInput(
                    autofocus: false,
                    obscureText: false,
                    textController: _emailController,
                    hintText: 'Email',
                    validator: (value) {
                      if (value == "" || value!.isEmpty) {
                        return "Please fill Email";
                      }
                      return "";
                    },
                  ),
                ),
                const Padding(padding: EdgeInsets.all(2)),
                const SizedBox(height: 10),
                //Password textfield

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: AppInput(
                    autofocus: false,
                    obscureText: true,
                    textController: _passwordController,
                    hintText: 'Password',
                    validator: (value) {
                      if (value == "" || value!.isEmpty) {
                        return "Please fill Password";
                      }
                      return "";
                    },
                  ),
                ),
                const Padding(padding: EdgeInsets.all(2)),
                const SizedBox(height: 10),
                //Confirm Password textfield

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: AppInput(
                    autofocus: false,
                    obscureText: true,
                    textController: _confirmpasswordController,
                    hintText: 'Confirm Password',
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Please confirm password";
                      }
                      return "";
                    },
                  ),
                ),

                const SizedBox(height: 20),

                //signUp button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: AppButton(
                    onTap: signUp,
                    text: 'Sign Up',
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                // a member? login now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "I'm a member?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        " Login Now",
                        style: TextStyle(
                          color: Color.fromARGB(255, 152, 97, 93),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
