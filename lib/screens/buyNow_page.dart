import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import 'package:rugwell/screens/home_page.dart';
import 'package:rugwell/widgets/app_button.dart';
import 'package:rugwell/widgets/app_input.dart';
import 'package:http/http.dart' as http;

class BuyNowPage extends StatefulWidget {
  BuyNowPage({Key? key}) : super(key: key);

  @override
  State<BuyNowPage> createState() => _BuyNowPageState();
}

class _BuyNowPageState extends State<BuyNowPage> {
  // text controllers
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  sendEmail() async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    await http.post(url,
        headers: {
          'origin': "http://localhost",
          "Content-Type": "application/json"
        },
        body: json.encode({
          'service_id': 'service_xc0ui0e',
          'template_id': 'template_cwtywkp',
          'user_id': 'P17yJsXk289NgrMiG',
          'template_params': {
            'subject': 'New order',
            'address': _addressController.text,
            'phonenumber': _phoneNumberController.text,
            'email': _emailController.text,
          }
        }));
  }

  void showAlert() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: 'Order Completed Successfully!',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 207, 207, 207),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 207, 207),
        elevation: 0,
        title: Text(
          'Order Now',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => HomePage(),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: const Text(
                    "Enter your information to order your product ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 15),
                //adress textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: AppInput(
                    autofocus: false,
                    obscureText: false,
                    textController: _addressController,
                    onChange: (text) {
                      setState(() {});
                    },
                    hintText: 'Enter your Address',
                    validator: (value) {
                      if (value == "") {
                        return "Please Fill address";
                      } else if (value!.length < 7) {
                        return "addess Is Too Short";
                      }
                      return "";
                    },
                  ),
                ),
                const SizedBox(height: 15),

                //phone number textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: AppInput(
                    autofocus: false,
                    obscureText: false,
                    textController: _phoneNumberController,
                    onChange: (text) {
                      setState(() {});
                    },
                    hintText: 'Enter your Phone number',
                    validator: (value) {
                      if (value == "") {
                        return "Please Fill Phone number";
                      } else if (value!.length < 7) {
                        return "Password Is Too Short";
                      }
                      return "";
                    },
                  ),
                ),
                const SizedBox(height: 15),
                //email textfield

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: AppInput(
                    autofocus: false,
                    obscureText: false,
                    textController: _emailController,
                    hintText: 'Enter your Email',
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

                const SizedBox(height: 20),

                //odrer now button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: AppButton(
                    text: 'order now',
                    onTap: () async {
                      await sendEmail();
                      showAlert();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
