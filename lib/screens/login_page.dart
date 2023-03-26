import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rugwell/screens/forgotpw_page.dart';
import 'package:rugwell/screens/home_page.dart';
import 'package:rugwell/screens/intro_page.dart';
import 'package:rugwell/services/auth_service.dart';
import 'package:rugwell/widgets/app_button.dart';
import 'package:rugwell/widgets/app_input.dart';
import 'package:rugwell/widgets/square_tile.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  // final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
  // State<LoginPage> createState() => _LoginPageState();
}

// RegExp regExp = new RegExp(p);
bool obserText = true;

// void validation() {
//   final FormState? form = _formKey1.currentState;
//   if (form!.validate()) {
//     print("Yes");
//   } else {
//     print("No");
//   }
// }

class _LoginPageState extends State<LoginPage> {
  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //signin method
  Future signIn() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    //try to sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);

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

  //helps memory management
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 207, 207),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => IntroPage(),
            ),
          ),
        ),
      ),
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

                //saying welcome
                const Text(
                  "Welcome",
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 15),

                //Email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: AppInput(
                    autofocus: false,
                    obscureText: false,
                    textController: _emailController,
                    onChange: (text) {
                      setState(() {});
                    },
                    hintText: 'Email',
                    validator: (value) => EmailValidator.validate(value)
                        ? ""
                        : "Please enter a valid email",
                  ),

                  //   validator: (value) {
                  //     if (value == "") {
                  //       return "Please Fill Email";
                  //     } else if (!regExp.hasMatch(value!)) {
                  //       return "Email Is Invalid";
                  //     }
                  //     return "";
                  //   },
                ),
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
                      if (value == "") {
                        return "Please Fill Password";
                      } else if (value!.length < 7) {
                        return "Password Is Too Short";
                      }
                      return "";
                    },
                  ),
                ),

                SizedBox(height: 5),

                // forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ForgotPasswordPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Color.fromARGB(255, 152, 97, 93),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                //signin button
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23.0),
                    child: AppButton(
                      text: 'Sign In',
                      onTap: signIn,
                    )),

                const SizedBox(
                  height: 25,
                ),

                //or continue with
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    Text("Or Continue With"),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // google sign in button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: SquareTile(
                        imagePath: 'assets/images/google.png',
                        onTap: () => AuthService().signInWithGoogle(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),

                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Not a member?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        " Register Now",
                        style: TextStyle(
                            color: Color.fromARGB(255, 152, 97, 93),
                            fontWeight: FontWeight.bold),
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
