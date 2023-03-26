import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  const AppInput(
      {Key? key,
      required this.textController,
      required this.obscureText,
      this.inputValidator,
      required this.autofocus,
      this.formatters,
      this.inputType,
      this.onChange,
      this.hintText,
      this.labelText,
      this.lines = 1,
      required String Function(dynamic value) validator})
      : super(key: key);

  final TextEditingController textController;
  final String? hintText;
  final String? labelText;
  final int lines;
  final bool obscureText;
  final bool autofocus;
  final String? Function(String?)? inputValidator;
  final List<TextInputFormatter>? formatters;
  final TextInputType? inputType;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      controller: textController,
      obscureText: obscureText,
      maxLines: lines,
      validator: inputValidator,
      inputFormatters: formatters,
      keyboardType: inputType,
      onChanged: onChange,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 144, 69, 63)),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: hintText,
          fillColor: Color.fromARGB(255, 184, 184, 184),
          filled: true,
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.close,
              size: 16,
            ),
            onPressed: () => textController.clear(),
          )),
    );
  }
}
