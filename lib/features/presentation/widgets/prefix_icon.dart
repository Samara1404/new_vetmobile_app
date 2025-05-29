import 'package:flutter/material.dart';

class PrefixIcon extends StatelessWidget {
  const PrefixIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PrefixIcon(),
      width: 40, 
      height: 40,
      decoration: BoxDecoration(
        
        shape: BoxShape.circle,
        border: Border.all(
         color: Color.fromRGBO(1, 165, 96, 1),
          width: 1.0,
          
        ),
      ),
      
    );
  }
}