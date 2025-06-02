import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_vetmobile_app/bloc/auth/auth_bloc.dart';
import 'package:new_vetmobile_app/bloc/auth/auth_event.dart';
import 'package:new_vetmobile_app/core/constant/style.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 18),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: Color.fromRGBO(1, 165, 96, 1)),
        ),
        onPressed: () {
          context.read<AuthBloc>().add(GoogleSignInEvent()); 
        },
        icon: Image.asset('assets/images/google.png'),
        label: Text('Google', style: AppTextStyle.style6),
      ),
    );
  }
}