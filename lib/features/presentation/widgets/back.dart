import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Back extends StatelessWidget {
  const Back({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
      context.pop();
    }, icon: Image.asset('assets/images/back.png'));
  }
}