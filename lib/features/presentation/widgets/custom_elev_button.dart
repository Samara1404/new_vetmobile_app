import 'package:flutter/material.dart';

class CustomElevButton extends StatelessWidget {
  const CustomElevButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(onPressed: (){}, label: Text('')
    );
  }
}