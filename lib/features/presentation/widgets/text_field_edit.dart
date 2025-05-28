import 'package:flutter/material.dart';

class TextFieldEdit extends StatelessWidget {
  final Widget suffixIcon;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const TextFieldEdit({
    super.key,
    required this.suffixIcon, 
    required this.hintText, 
    this.obscureText = false,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText, 
          suffixIcon: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0), 
            child: Image.asset('assets/images/notes.png'), 
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 1.5,
              color:Color.fromRGBO(1, 165, 96, 1),),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
               width: 1.5,
               color:Color.fromRGBO(1, 165, 96, 1),),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        ),
        validator: validator,
      ),
    );
  }
}