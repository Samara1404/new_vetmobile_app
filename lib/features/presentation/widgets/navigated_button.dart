import 'package:flutter/material.dart';
import 'package:new_vetmobile_app/core/constant/style.dart';

class NavigatedButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;

  const NavigatedButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(      
        padding: EdgeInsets.symmetric(horizontal: 116, vertical: 18),
         backgroundColor: Color.fromRGBO(1, 165, 96, 1), 
         foregroundColor: Colors.white
      ),
      onPressed: onPressed,
    
      child: Text(title, style: AppTextStyle.style7,),
    );
  }
}